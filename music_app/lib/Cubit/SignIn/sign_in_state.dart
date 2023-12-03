part of 'sign_in_cubit.dart';

// ignore_for_file: prefer_typing_uninitialized_variables

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

//
final class SignInFailed extends SignInState {
  final error;
  SignInFailed({required this.error});
}

final class SignInError extends SignInState {
  final passError;
  final emailError;

  SignInError({required this.passError, required this.emailError});

  get getPassError => passError;
  get getEmailError => emailError;
}

// final class SignInEmailError extends LoginState {
//   final _emailError;

//   const LoginEmailError(this._emailError);

//   get emailError => _emailError;
// }

// final class LoginPassError extends LoginState {
//   final _passError;

//   const LoginPassError(this._passError);

//   get passError => _passError;
// }
