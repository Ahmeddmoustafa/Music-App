// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/music_player_cubit.dart';
import 'package:music_app/Presentation/Home/home_page.dart';
import 'package:music_app/Presentation/MusicPlayer/music_player_page.dart';
import 'package:music_app/Presentation/Playlist/playlist_page.dart';
import 'package:music_app/Presentation/Profile/profile_page.dart';
import 'package:music_app/Resources/Managers/strings_manager.dart';

class Routes {
  static const String mainRoute = '/main';
  static const String profileRoute = '/profile';
  static const String playlistsRoute = '/playlist';
  static const String musicPlayerRoute = '/music';

  static const String apartmentRoute = '/apartment';
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String storeDetailsRoute = '/store';
  static const String onBoardingRoute = '/onboarding';
  static const String settingsRoute = '/settings';
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
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
      case Routes.musicPlayerRoute:
        {
          return MaterialPageRoute(builder: (context) => MusicPlayer());
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
