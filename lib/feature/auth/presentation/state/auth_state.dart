part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final User user;

  LoginSuccess({required this.user});
}

class GetUserSuccess extends AuthState {
  final User user;

  GetUserSuccess({required this.user});
}

class GetUserLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final User user;

  RegisterSuccess({required this.user});
}

class LoginLoading extends AuthState {}

class RegisterLoading extends AuthState {}

class LoginFailure extends AuthState {
  final String? error;

  LoginFailure(this.error);
}

class GetUserFailure extends AuthState {
  final String? error;

  GetUserFailure(this.error);
}
class DeleteUserLoading extends AuthState {}
class DeleteUserSuccess extends AuthState {
  final User user;

  DeleteUserSuccess({required this.user});
}
class DeleteUserFailure extends AuthState {
  final String? error;

  DeleteUserFailure(this.error);
}

class RegisterFailure extends AuthState {
  final String? error;

  RegisterFailure(this.error);
}
class CheckBox extends AuthState{

}