import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:music_app/Data/Remote/firebase_services.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final authservice = FirebaseServices();

  late String email;
  late String password;
  late String confirmPassword;
  late String emailError;
  late String passwordError;
  late String confirmPasswordError;
  SignUpCubit() : super(SignUpInitial());

  void initVariables() {
    email = emailController.text;
    password = passwordController.text;
    confirmPassword = confirmPasswordController.text;
    emailError = "";
    passwordError = "";
    confirmPasswordError = "";
  }

  void signUp() async {
    emit(SignUpLoading());
    initVariables();
    bool emailerror = false;
    bool passerror = false;
    bool confirmpasserror = false;

    if (!EmailValidator.validate(email)) {
      emailError = "Invalid Email Address";
      emailerror = true;
    }
    if (password.length < 8) {
      passwordError = "Please enter password at least 8 characters";
      passerror = true;
    }
    if (password != confirmPassword) {
      confirmPasswordError = "The two passwords are different";
      confirmpasserror = true;
    }

    if (passerror || emailerror || confirmpasserror) {
      emit(
        SignUpError(
          passError: passerror ? passwordError : null,
          emailError: emailerror ? emailError : null,
          confirmPasswordError: confirmpasserror ? confirmPasswordError : null,
        ),
      );
    }
    if (EmailValidator.validate(email) &&
        password.length >= 8 &&
        !confirmpasserror) {
      // Perform your login/authentication logic here

      try {
        await authservice.signUp(email, password, fullNameController.text);
        emit(SignUpFinished());
      } catch (err) {
        emit(SignUpFailed(error: err.toString()));
      }

      return;
    }
  }

  Future<void> googleSignUp() async {
    emit(SignUpLoading());

    try {
      await authservice.googleSignUp();
      emit(SignUpFinished());
    } on FirebaseException catch (err) {
      emit(SignUpFailed(error: err.message.toString()));
    }
  }
}
