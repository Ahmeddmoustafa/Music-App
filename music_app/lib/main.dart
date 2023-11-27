import 'package:flutter/material.dart';
import 'package:music_app/Presentation/Home/home_page.dart';
import 'package:music_app/Presentation/Playlist/playlist_page.dart';
import 'package:music_app/Presentation/Profile/profile_page.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music App',
        theme: getApplicationtheme(false),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.mainRoute,
      ),
    );
  }
}
