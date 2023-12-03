import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String email;
  late String password;
  late String emailError;
  late String passwordError;
  // final authservice = AuthService();
  SignInCubit() : super(SignInInitial());

  void initVariables() {
    email = emailController.text;
    password = passwordController.text;
    emailError = "";
    passwordError = "";
  }

  void signIn() async {
    emit(SignInInitial());
    initVariables();
    bool emailerror = false;
    bool passerror = false;

    if (!EmailValidator.validate(email)) {
      emailError = "Invalid Email Address";
      emailerror = true;
    }
    if (password.length < 8) {
      passwordError = "Please enter password at least 8 characters";
      passerror = true;
    }

    if (passerror || emailerror) {
      emit(
        SignInError(
            passError: passerror ? passwordError : null,
            emailError: emailerror ? emailError : null),
      );
    }

    if (EmailValidator.validate(email) && password.length >= 8) {
      try {
        // await authservice.signIn(email, password);
        emit(SignInLoading());
      } catch (err) {
        emit(SignInFailed(error: err.toString()));
      }
      return;
    }
  }
}
