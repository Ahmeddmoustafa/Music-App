import 'package:flutter/material.dart';
import 'package:music_app/Presentation/Utils/screen_helper.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(
          width: ScreenHelper.isMobile(context) ? AppSize.s100 : AppSize.s400,
          image: AssetImage(AssetsManager.Logo),
        ),
      ),
      body: ScreenHelper(
        desktop: buildWeb(context, width, height),
        mobile: buildMobile(context, width, height),
        tablet: buildWeb(context, width, height),
      ),
    );
  }

  Widget buildWeb(BuildContext context, double width, double height) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Music For Everyone",
                    style: textTheme.displayLarge,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: AppSize.s10),
                    width: width * 0.2,
                    height: height * 0.07,
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
              Flexible(
                child: SizedBox(
                  width: width * 0.2,
                  child: Text(
                    AppStrings.dummy,
                    textAlign: TextAlign.center,
                    style: textTheme.displayMedium,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Flexible(
          child: Image(
            fit: BoxFit.cover,
            // height: height,
            image: AssetImage(AssetsManager.Onboarding),
          ),
        ),
      ],
    );
  }

  Widget buildMobile(BuildContext context, double width, double height) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Music For Everyone",
                      style: textTheme.displayLarge,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: AppSize.s10),
                      width: width * 0.5,
                      height: height * 0.07,
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
          const Image(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManager.Onboarding),
          ),
        ],
      ),
    );
  }
}
