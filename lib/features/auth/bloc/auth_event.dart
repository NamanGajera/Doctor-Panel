part of 'auth_bloc.dart';

@immutable
class AuthEvent {}

class ToggleLoginAndSignUpPageEvent extends AuthEvent {
  final bool isLoginPage;
  ToggleLoginAndSignUpPageEvent({required this.isLoginPage});
}
