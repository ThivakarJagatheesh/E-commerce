import 'package:scanner/Data/Models/app_error.dart';
import 'package:scanner/Data/Models/user.dart';

import 'package:dartz/dartz.dart';
abstract class AuthenticationRepository{
  Future<Either<AppError,Users>>createUser(String username, String password);
}