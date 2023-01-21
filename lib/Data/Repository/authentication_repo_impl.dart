import 'dart:io';

import 'package:scanner/Data/Data_source/authentication_data_source.dart';
import 'package:scanner/Data/Models/json_response_exception.dart';
import 'package:scanner/Data/Models/json_response_status.dart';
import 'package:scanner/Data/Models/user.dart';
import 'package:scanner/Data/Models/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:scanner/Domain/Repository/authentication_repo.dart';

class AuthenticationRepoImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  AuthenticationRepoImpl(this.authenticationRemoteDataSource);
  @override
  Future<Either<AppError, Users>> createUser(
      String userName, String password) async {
    try {
      final response =
          await authenticationRemoteDataSource.createUser(userName, password);
      return Right(response);
    } on SocketException {
      return Left(
          AppError(AppErrorType.network, 'Server Connectivity Error!!!'));
    } on JsonResponseStatusException catch (e) {
      return Left(AppError(AppErrorType.api, e.message.toString()));
    }
  }
}
