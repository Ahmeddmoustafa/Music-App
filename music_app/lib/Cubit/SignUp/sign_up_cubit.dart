import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  // final authservice = AuthService();

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
    emit(SignUpInitial());
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

      // try {
      //   final user =
      //       await getRenter(SignInParams(email: email, password: password));
      // } catch (serverFailure) {
      //   debugPrint("server error");
      try {
        // await authservice.signUp(email, password);
        emit(SignUpLoading());
      } catch (err) {
        emit(SignUpFailed(error: err.toString()));
      }

      return;
    }
  }
}
