part of 'login_cubit.dart';

@immutable
abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}
class LoginFailure extends LoginState {}
class PasswordVisibilityState extends LoginState{}
