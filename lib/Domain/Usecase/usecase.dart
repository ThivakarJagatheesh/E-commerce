import 'package:scanner/Data/Models/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
