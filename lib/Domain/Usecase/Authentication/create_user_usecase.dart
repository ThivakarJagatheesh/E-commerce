import 'package:scanner/Data/Models/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:scanner/Data/Models/user.dart';
import 'package:scanner/Domain/Repository/authentication_repo.dart';
import 'package:scanner/Domain/Usecase/usecase.dart';

class CreateUserUsecase extends Usecase<Users, Users> {
  final AuthenticationRepository authenticationRepository;
  CreateUserUsecase(this.authenticationRepository);
  @override
  Future<Either<AppError, Users>> call(Users params) async =>
      await authenticationRepository.createUser(
          params.username!, params.password!);
}
