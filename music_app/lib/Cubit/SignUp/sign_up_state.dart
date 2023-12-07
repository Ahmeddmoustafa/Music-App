// ignore_for_file: prefer_typing_uninitialized_variables

part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpFinished extends SignUpState {}

final class SignUpFailed extends SignUpState {
  final String error;

  SignUpFailed({required this.error});
}

final class SignUpLoading extends SignUpState {}

final class SignUpError extends SignUpState {
  final passError;
  final emailError;
  final confirmPasswordError;

  SignUpError(
      {required this.passError,
      required this.emailError,
      required this.confirmPasswordError});

  get getPassError => passError;
  get getConfirmPassError => confirmPasswordError;

  get getEmailError => emailError;
}
