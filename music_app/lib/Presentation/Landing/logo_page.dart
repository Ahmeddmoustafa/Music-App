import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(
            AssetsManager.Logo,
          ),
        ),
      ),
    );
  }
}
