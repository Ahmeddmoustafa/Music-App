import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/fonts_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        // automaticallyImplyLeading: false,
        title: const Image(
          width: AppSize.s100,
          image: AssetImage(AssetsManager.Logo),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width * 0.9,
            height: height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign In Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.Pink,
                    fontSize: FontSize.s22,
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                TextFormField(
                  style: textTheme.displaySmall,
                  decoration: InputDecoration(
                    labelStyle: textTheme.displaySmall,
                    labelText: 'Email',
                    // errorText: "",
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                TextFormField(
                  style: textTheme.displaySmall,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: textTheme.displaySmall,
                    hintStyle: textTheme.displaySmall,
                    labelText: 'Password',
                    // errorText: "nul",
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.mainRoute);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.Pink,
                        borderRadius: BorderRadius.circular(AppSize.s10)),
                    width: AppSize.s200,
                    height: AppSize.s40,
                    child: const Center(
                      child: Text(
                        "Sign In",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    GestureDetector(
                      // onTap: () => Navigator.pushReplacementNamed(
                      //     context, Routes.signInRoute),
                      child: Text(
                        "Signup Now",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
