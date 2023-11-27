import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        height: height * 0.4,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: ColorManager.DarkGrey,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(AppSize.s50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorManager.White,
                    ),
                  ),
                  Text(
                    "Profile",
                    style: textTheme.displayLarge,
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: ColorManager.White,
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.Black,
              ),
            ),
            Text(
              "Profile Name",
              style: textTheme.bodyLarge,
            ),
            Text(
              "ProfileEmail@gmail.com",
              style: textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text("Followers"),
                    Text(
                      "123",
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("Followers"),
                    Text(
                      "265",
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
