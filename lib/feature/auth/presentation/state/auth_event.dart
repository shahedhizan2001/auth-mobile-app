part of 'auth_bloc.dart';


@immutable
abstract class AuthEvent {
}

class LoginAuth extends AuthEvent {
}

class RegisterAuth extends AuthEvent {

}
class GetUser extends AuthEvent {

}
class DeleteUser extends AuthEvent {

}
class ChangeCheckBox extends AuthEvent {
 final bool isChecked;

  ChangeCheckBox({required this.isChecked});
}