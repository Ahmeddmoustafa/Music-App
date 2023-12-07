import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app/Cubit/MusicPlayer/music_player_cubit.dart';
import 'package:music_app/Cubit/SignUp/sign_up_cubit.dart';
import 'package:music_app/Cubit/Track/track_cubit.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Theme/theme_data.dart';
import 'package:music_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          BlocProvider(
            create: (context) => SignUpCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Music App',
          theme: getApplicationtheme(false),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.authRoute,
        ),
      ),
    );
  }
}

void init() {
  Hive.registerAdapter(AlbumAdapter());
}
