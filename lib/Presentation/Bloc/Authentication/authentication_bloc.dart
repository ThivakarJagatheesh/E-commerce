import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/Common/Utilities/shared_storage.dart';
import 'package:scanner/Data/Config/app_constants.dart';
import 'package:scanner/Data/Models/user.dart';
import 'package:scanner/Domain/Usecase/Authentication/create_user_usecase.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.createUserUsecase) : super(AuthenticationInitial());
  final CreateUserUsecase createUserUsecase;

  void createUser(String username, String password) async {
    final response =
        await createUserUsecase(Users(username: username, password: password));
    emit(response.fold(
        (l) => AuthenticationFailure(l.errorMsg), (r) => AuthenticationSuccess()));
  }

  void autoLogin() {
    final res = SharedStorage.getString(AppConstants.LoginPojo);
    if (res.isNotEmpty) {
      emit(AutoLoginState());
    } else {
      emit(AuthenticationNotAuthenticated());
    }
  }
  // void authenticationChecking()async{
  //   final response = await
  // }
}
