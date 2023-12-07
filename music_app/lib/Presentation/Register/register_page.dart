import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/SignUp/sign_up_cubit.dart';
import 'package:music_app/Presentation/Auth/auth_gate.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
// import 'package:music_app/Resources/Managers/strings_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
      body: Stack(
        children: [
          Positioned(
            width: width,
            top: height * 0,
            child: SizedBox(
              height: height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Music For Everyone",
                    style: textTheme.displayLarge,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.signUpRoute);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.Pink,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        border: Border.all(color: ColorManager.DarkGrey),
                      ),
                      width: width * 0.7,
                      height: height * 0.07,
                      child: Center(
                        child: Text(
                          "Sign Up Free",
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      border: Border.all(color: ColorManager.DarkGrey),
                    ),
                    width: width * 0.7,
                    height: height * 0.07,
                    child: BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpLoading) {
                          Navigator.pushReplacementNamed(
                              context, Routes.authRoute);
                        }
                      },
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            await BlocProvider.of<SignUpCubit>(context)
                                .googleSignUp();
                          },
                          child: FractionallySizedBox(
                            widthFactor: 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: AppSize.s10,
                                  ),
                                  child: Icon(
                                    Icons.facebook,
                                    color: ColorManager.Pink,
                                  ),
                                ),
                                Text(
                                  "Sign Up With Google",
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      border: Border.all(color: ColorManager.DarkGrey),
                    ),
                    width: width * 0.7,
                    height: height * 0.07,
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppSize.s10,
                            ),
                            child: Icon(
                              Icons.facebook,
                              color: ColorManager.Pink,
                            ),
                          ),
                          Text(
                            "Sign Up With Facebook",
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
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
              image: AssetImage(
                AssetsManager.Onboarding,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
