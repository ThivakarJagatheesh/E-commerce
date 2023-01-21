import 'package:scanner/Common/Utilities/shared_storage.dart';
import 'package:scanner/Data/Config/api_client.dart';
import 'package:scanner/Data/Config/app_constants.dart';
import 'package:scanner/Data/Models/user.dart';
import 'dart:convert';

abstract class AuthenticationRemoteDataSource {
  Future<Users> createUser(String userName, String password);
}

class AuthenticationReomteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient apiClient;
  AuthenticationReomteDataSourceImpl(this.apiClient);
  @override
  Future<Users> createUser(String userName, String password) async {
    final createUserUrl = AppConstants.baseUrl;
    Map<String, dynamic> body = {"username": userName, "password": password};
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json'
    };
    final res = await apiClient.postMethod('$createUserUrl/auth/login',
        body: body, headers: headers);
    await SharedStorage.setString(AppConstants.LoginPojo, res);
    return Users.fromJson(json.decode(res));
  }
}
