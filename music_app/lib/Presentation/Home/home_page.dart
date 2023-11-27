import 'package:flutter/material.dart';
import 'package:music_app/Presentation/AppBars/Music_app_bar.dart';
import 'package:music_app/Presentation/Home/artists.dart';
import 'package:music_app/Presentation/Home/todays_hits.dart';
import 'package:music_app/Presentation/Widgets/custom_spacer.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, height * 0.1),
        child: const MusicAppBar(
          action: Icon(
            Icons.settings,
          ),
          title: Text("LOGO"),
          home: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: AppSize.s10),
            width: width * 0.9,
            color: ColorManager.Black,
            child: Column(
              children: [
                const TodayHits(),
                Container(
                  margin: const EdgeInsets.only(top: AppSize.s10),
                  height: height * 0.3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.Pink,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const Artists(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
