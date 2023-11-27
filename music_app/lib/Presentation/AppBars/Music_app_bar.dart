import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';

class MusicAppBar extends StatelessWidget {
  final action;
  final Widget title;
  final bool home;
  const MusicAppBar(
      {super.key,
      required this.action,
      required this.title,
      required this.home});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      elevation: !home ? 10 : 0,
      title: SizedBox(
          width: width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.search,
                color: ColorManager.White,
              ),
              title,
              action,
            ],
          )),
    );
  }
}
