import 'package:firebase_auth/firebase_auth.dart';
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
    // final height = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: !home ? 10 : 0,
      title: SizedBox(
          width: width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              home
                  ? InkWell(
                      onTap: () => FirebaseAuth.instance.signOut(),
                      child: Icon(
                        Icons.logout,
                        color: ColorManager.White,
                      ),
                    )
                  : InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: ColorManager.White,
                      ),
                    ),
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
