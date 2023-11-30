import 'package:flutter/material.dart';
import 'package:music_app/Presentation/Profile/most_played.dart';
import 'package:music_app/Presentation/Profile/profile_header.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: AppSize.s20),
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "data",
                          style: textTheme.displayLarge,
                        ),
                        Text(
                          "data",
                          style: textTheme.displayLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "data",
                          style: textTheme.displayLarge,
                        ),
                        Text(
                          "data",
                          style: textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.0, // Height of the line
              width: width * 0.9, // Width of the line
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset:
                        const Offset(0, 3), // Offset in the X and Y directions
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: AppSize.s25),
              width: width * 0.8,
              child: Text(
                "Mostly Played",
                style: textTheme.displayLarge,
              ),
            ),
            const MostPlayed(),
          ],
        ),
      ),
    );
  }
}
