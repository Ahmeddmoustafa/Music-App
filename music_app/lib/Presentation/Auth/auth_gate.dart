import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/SignIn/sign_in_cubit.dart';
import 'package:music_app/Presentation/Home/home_page.dart';
import 'package:music_app/Presentation/Landing/logo_page.dart';
import 'package:music_app/Presentation/Landing/onboarding_page.dart';
import 'package:music_app/Presentation/Register/register_page.dart';
import 'package:music_app/Presentation/Register/sign_in_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return OnBoardingPage();
          // return BlocProvider(
          //   create: (context) => SignInCubit(),
          //   child: const SignInPage(),
          // );
        }
      },
    );
  }
}
