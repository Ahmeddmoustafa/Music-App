import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/strings_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Image(
          width: AppSize.s100,
          image: AssetImage(AssetsManager.Logo),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            width: width,
            top: height * 0,
            child: SizedBox(
              height: height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Music For Everyone",
                        style: textTheme.displayLarge,
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              ColorManager.Pink,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child: Text(
                            "Get Started",
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Text(
                      AppStrings.dummy,
                      textAlign: TextAlign.center,
                      style: textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(AssetsManager.Onboarding),
            ),
          ),
        ],
      ),
    );
  }
}
