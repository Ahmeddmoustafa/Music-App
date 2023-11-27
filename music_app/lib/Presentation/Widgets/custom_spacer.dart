import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: AppSize.s10,
      color: ColorManager.Transparent,
    );
  }
}
