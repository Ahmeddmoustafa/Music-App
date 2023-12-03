import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/fonts_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  "Register Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.Pink,
                    fontSize: FontSize.s22,
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                TextFormField(
                  style: textTheme.displaySmall,
                  // obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: textTheme.displaySmall,
                    labelText: 'Full Name',
                    // errorText: "null",
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
                TextFormField(
                  style: textTheme.displaySmall,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: textTheme.displaySmall,

                    labelText: 'Confirm Password',
                    // errorText: "null",
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
                        "Register",
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
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signInRoute),
                        child: Text(
                          "Login Now",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
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
