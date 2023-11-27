import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';

class MusicAppBar extends StatelessWidget {
  final Widget action;
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
      automaticallyImplyLeading: home ? false : true,
      elevation: !home ? 10 : 0,
      title: SizedBox(
          width: width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              home
                  ? Icon(
                      Icons.search,
                      color: ColorManager.White,
                    )
                  : Container(),
              title,
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.profileRoute);
                  },
                  child: action),
            ],
          )),
    );
  }
}
