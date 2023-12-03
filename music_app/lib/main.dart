import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app/Cubit/music_player_cubit.dart';
import 'package:music_app/Cubit/track_cubit.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Theme/theme_data.dart';

void main() async {
  await Hive.initFlutter();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TracksCubit(),
          ),
          BlocProvider(
            create: (context) => MusicPlayerCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Music App',
          theme: getApplicationtheme(false),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.onBoardingRoute,
        ),
      ),
    );
  }
}

void init() {
  Hive.registerAdapter(AlbumAdapter());
}
