import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/ui/home/widgets/custom_elevated_button.dart';
import 'package:evently_app/ui/home/widgets/custom_text_form_field.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/dialog_utils.dart';
import 'package:evently_app/widgets/language_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: width * 0.04, right: width * 0.04, left: width * 0.04),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: height * 0.2, child: Image.asset(AppAssets.logo)),
                    SizedBox(height: height * 0.028),
                    CustomTextFormField(
                      prefixIcon: Image.asset(
                        AppAssets.iconEmail,
                        color:
                            themeProvider.appTheme == ThemeMode.dark
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                      ),
                      hintText: AppLocalizations.of(context)!.email,
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      colorBorderSide:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your email';
                        }
                        final bool emailValid = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(text);

                        if (!emailValid) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * .02),
                    CustomTextFormField(
                      prefixIcon: Image.asset(
                        AppAssets.iconPassword,
                        color:
                            themeProvider.appTheme == ThemeMode.dark
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                      ),
                      colorBorderSide:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                      hintText: AppLocalizations.of(context)!.password,
                      hintStyle: Theme.of(context).textTheme.headlineSmall,
                      sufficIcon: Image.asset(
                        AppAssets.iconShowPassword,
                        color:
                            themeProvider.appTheme == ThemeMode.dark
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                      ),
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (text.length < 6) {
                          return 'Password should be greater than 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // todo: go to forgot password screen
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forget_password,
                          style: AppStyles.bold16Primary.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryLight,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    CustomElevatedButton(
                      buttonContent: Text(
                        AppLocalizations.of(context)!.login,
                        style: AppStyles.medium20White,
                      ),
                      onPressed: () {
                        loginValidation();
                      },
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dont_have_account,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.registerScreen);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.create_account,
                            style: AppStyles.bold16Primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.028),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: AppColors.primaryLight,
                            indent: width * 0.05,
                            endIndent: width * 0.05,
                          ),
                        ),
                        Text('Or', style: AppStyles.medium16Primary),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: AppColors.primaryLight,
                            indent: width * 0.05,
                            endIndent: width * 0.05,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                    CustomElevatedButton(
                      buttonContent: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(AppAssets.iconGoogle)),
                          SizedBox(width: width * 0.02),
                          Text(
                            AppLocalizations.of(context)!.login_with_google,
                            style: AppStyles.medium20Primary,
                          ),
                        ],
                      ),
                      onPressed: () {
                        // todo: go to google login
                      },
                      textStyle: AppStyles.medium20Primary,
                      backgroundColor:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.primaryDark
                              : AppColors.whiteBgColor,
                      borderSideColor: AppColors.primaryLight,
                    ),
                    SizedBox(height: height * 0.02),
                    Center(
                      child: SizedBox(
                        width: width * 0.18,
                        height: height * 0.035,
                        child: LanguageSwitch(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginValidation() async {
    if (formKey.currentState!.validate()) {
      DialogUtils.showLoading(context: context, loadingText: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          contentMsg: 'logged in successfully',
          posActionName: 'OK',
          posActionFunction: () => Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          print('No user found for this e-mail or wrong password.');
          DialogUtils.showMessage(
            context: context,
            contentMsg: 'No user found for this e-mail or wrong password.',
            posActionName: 'OK',
            title: 'Warning',
            contentStyle: AppStyles.medium16Red,
            posActionFunction: () {
              Navigator.pop(context);
            },
          );
        } else if (e.code == 'network-request-failed') {
          print('No internet connection');
          DialogUtils.showMessage(
            context: context,
            contentMsg: 'This account already exists for that email.',
            posActionName: 'OK',
            title: 'Warning',
            contentStyle: AppStyles.medium16Red,
            posActionFunction: () {
              Navigator.pop(context);
            },
          );
        } else {
          print(e);
        }
      }
    }
  }
}
