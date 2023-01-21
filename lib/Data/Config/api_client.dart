import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scanner/Data/Models/http_error.dart';
import 'package:scanner/Data/Models/json_response_exception.dart';

class ApiClient {
  final Client client;
  ApiClient(this.client);
  String paramsString = '';

  dynamic postMethod(String path,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final response = await client.post(getPath(path, null),
        headers: headers, body: body != null ? json.encode(body) : null);
    if (response.statusCode == 200) {
      return response.body;
    }
    if (response.statusCode == 401) {
      throw JsonResponseStatusException(message: response.body);
    } else {
      HttpError httpError = HttpError.fromJson(json.decode(response.body));
      debugPrint("Error " + httpError.toString());
      throw JsonResponseStatusException(message: httpError.toString());
    }
  }

  dynamic getMethod(String path,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final response = await client.get(
      getPath(path, body ?? null),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      HttpError httpError = HttpError.fromJson(json.decode(response.body));
      debugPrint("Error " + httpError.toString());
      throw JsonResponseStatusException(message: httpError.toString());
    }
  }

  dynamic putMethod(String path,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final response = await client.put(getPath(path, null),
        headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      HttpError httpError = HttpError.fromJson(json.decode(response.body));
      debugPrint("Error " + httpError.toString());
      throw JsonResponseStatusException(message: httpError.toString());
    }
  }

  dynamic deleteMethod(String path, {Map<String, dynamic>? body}) async {
    Request request = Request('DELETE', getPath(path, null));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(body);
    final response =
        await client.send(request).then((value) => Response.fromStream(value));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      HttpError httpError = HttpError.fromJson(json.decode(response.body));
      debugPrint("Error " + httpError.toString());
      throw JsonResponseStatusException(message: httpError.toString());
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    debugPrint('$path');
    return Uri.parse('$path');
    //'${ApiConfig.v2baseurl}$path?api_key=${ApiConfig.auth}$paramsString');
    //return Uri.parse('$path?api_key=${ApiConstants.API_KEY}$paramsString');
  }
}
