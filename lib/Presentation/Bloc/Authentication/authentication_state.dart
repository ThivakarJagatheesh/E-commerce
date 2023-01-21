part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
    @override
  List<Object> get props => [];
}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AutoLoginState extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;
  AuthenticationFailure(this.message);
  @override
  List<Object> get props => [message];
}
