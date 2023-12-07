// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/SignIn/sign_in_cubit.dart';
import 'package:music_app/Cubit/SignUp/sign_up_cubit.dart';
import 'package:music_app/Presentation/AppBars/bottom_music_bar.dart';
import 'package:music_app/Presentation/Auth/auth_gate.dart';
import 'package:music_app/Presentation/Home/home_page.dart';
import 'package:music_app/Presentation/Landing/logo_page.dart';
import 'package:music_app/Presentation/Landing/onboarding_page.dart';
import 'package:music_app/Presentation/MusicPlayer/music_player_page.dart';
import 'package:music_app/Presentation/Playlist/playlist_page.dart';
import 'package:music_app/Presentation/Profile/profile_page.dart';
import 'package:music_app/Presentation/Register/register_page.dart';
import 'package:music_app/Presentation/Register/sign_in_page.dart';
import 'package:music_app/Presentation/Register/sign_up_page.dart';
import 'package:music_app/Resources/Managers/strings_manager.dart';

class Routes {
  static const String mainRoute = '/main';
  static const String profileRoute = '/profile';
  static const String playlistsRoute = '/playlist';
  static const String musicPlayerRoute = '/music';
  static const String bottomPlayerRoute = '/bottom';
  static const String logoRoute = '/logo';
  static const String onBoardingRoute = '/onboarding';
  static const String signUpRoute = '/signup';
  static const String signInRoute = '/signin';
  static const String authRoute = '/auth';

  static const String apartmentRoute = '/apartment';
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        {
          return MaterialPageRoute(builder: (context) => HomePage());
        }
      case Routes.profileRoute:
        {
          return MaterialPageRoute(builder: (context) => ProfilePage());
        }
      case Routes.playlistsRoute:
        {
          return MaterialPageRoute(builder: (context) => PlayListPage());
        }
      case Routes.logoRoute:
        {
          return MaterialPageRoute(builder: (context) => LogoPage());
        }
      case Routes.musicPlayerRoute:
        {
          return MaterialPageRoute(
            builder: (context) => MusicPlayer(
              sameSong: settings.arguments as bool,
            ),
          );
        }
      case Routes.bottomPlayerRoute:
        {
          return MaterialPageRoute(builder: (context) => BottomMusicBar());
        }
      case Routes.onBoardingRoute:
        {
          return MaterialPageRoute(builder: (context) => OnBoardingPage());
        }
      case Routes.registerRoute:
        {
          return MaterialPageRoute(builder: (context) => RegisterPage());
        }
      case Routes.signUpRoute:
        {
          return MaterialPageRoute(builder: (context) => SignUpPage());
        }
      case Routes.signInRoute:
        {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SignInCubit(),
              child: SignInPage(),
            ),
          );
        }
      case Routes.authRoute:
        {
          return MaterialPageRoute(builder: (context) => AuthGate());
        }

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: Text(AppStrings.noRouteFound),
      ),
    );
  }
}
