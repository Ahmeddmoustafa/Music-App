import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/SignUp/sign_up_cubit.dart';
import 'package:music_app/Presentation/Utils/screen_helper.dart';
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
        title: Image(
          width: ScreenHelper.isMobile(context) ? AppSize.s100 : AppSize.s400,
          image: const AssetImage(AssetsManager.Logo),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: ScreenHelper.isMobile(context) ? width * 0.9 : width * 0.5,
            height: height * 0.9,
            child: BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpLoading) {
                  Navigator.pushReplacementNamed(context, Routes.authRoute);
                } else if (state is SignUpFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    showCloseIcon: true,
                    content: Text(state.error),
                  ));
                }
              },
              builder: (context, state) {
                return Column(
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
                      controller:
                          context.read<SignUpCubit>().fullNameController,
                      style: textTheme.displaySmall,
                      decoration: InputDecoration(
                        labelStyle: textTheme.displaySmall,
                        labelText: 'Full Name',
                        // errorText: "null",
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    TextFormField(
                      controller: context.read<SignUpCubit>().emailController,
                      style: textTheme.displaySmall,
                      decoration: InputDecoration(
                        labelStyle: textTheme.displaySmall,
                        labelText: 'Email',
                        errorText:
                            state is SignUpError ? state.emailError : null,
                        // errorText: "",
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    TextFormField(
                      controller:
                          context.read<SignUpCubit>().passwordController,
                      style: textTheme.displaySmall,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelStyle: textTheme.displaySmall,
                        hintStyle: textTheme.displaySmall,
                        labelText: 'Password',
                        errorText:
                            state is SignUpError ? state.passError : null,
                        // errorText: "nul",
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    TextFormField(
                      controller:
                          context.read<SignUpCubit>().confirmPasswordController,
                      style: textTheme.displaySmall,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelStyle: textTheme.displaySmall,
                        labelText: 'Confirm Password',
                        errorText: state is SignUpError
                            ? state.confirmPasswordError
                            : null,
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(
                        //     context, Routes.mainRoute);
                        BlocProvider.of<SignUpCubit>(context).signUp();
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
                            onTap: () => Navigator.pushNamed(
                                context, Routes.signInRoute),
                            child: Text(
                              "Login Now",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
