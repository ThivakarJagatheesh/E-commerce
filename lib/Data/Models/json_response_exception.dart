import 'json_response_status.dart';

class JsonResponseStatusException implements Exception {
  final JsonResponseStatus? error;
  final String? message;

  JsonResponseStatusException({this.error,this.message});
}