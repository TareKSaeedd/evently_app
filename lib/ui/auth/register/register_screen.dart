import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/ui/home/widgets/custom_elevated_button.dart';
import 'package:evently_app/ui/home/widgets/custom_text_form_field.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/widgets/language_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  //create a validation Key steps
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentClolr,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: width * 0.04, right: width * 0.04, left: width * 0.04),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.2, child: Image.asset(AppAssets.logo)),
                  SizedBox(height: height * 0.028),

                  CustomTextFormField(
                    prefixIcon: Image.asset(
                      AppAssets.iconUsername,
                      color:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.whiteColor
                              : AppColors.greyColor,
                    ),
                    hintText: AppLocalizations.of(context)!.name,
                    hintStyle: Theme.of(context).textTheme.headlineSmall,
                    controller: usernameController,
                    keyboardType: TextInputType.emailAddress,
                    colorBorderSide:
                        themeProvider.appTheme == ThemeMode.dark
                            ? AppColors.primaryLight
                            : AppColors.greyColor,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * .02),
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
                    colorBorderSide:
                        themeProvider.appTheme == ThemeMode.dark
                            ? AppColors.primaryLight
                            : AppColors.greyColor,
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
                  SizedBox(height: height * .02),
                  CustomTextFormField(
                    prefixIcon: Image.asset(
                      AppAssets.iconPassword,
                      color:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.whiteColor
                              : AppColors.greyColor,
                    ),
                    hintText: AppLocalizations.of(context)!.re_password,
                    hintStyle: Theme.of(context).textTheme.headlineSmall,
                    sufficIcon: Image.asset(
                      AppAssets.iconShowPassword,
                      color:
                          themeProvider.appTheme == ThemeMode.dark
                              ? AppColors.whiteColor
                              : AppColors.greyColor,
                    ),
                    controller: rePasswordController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    colorBorderSide:
                        themeProvider.appTheme == ThemeMode.dark
                            ? AppColors.primaryLight
                            : AppColors.greyColor,
                    validator: (text) {
                      if (passwordController.text != text) {
                        return 'Re-entered password does not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.028),
                  CustomElevatedButton(
                    buttonContent: Text(
                      AppLocalizations.of(context)!.create_account,
                      style: AppStyles.medium20White,
                    ),
                    onPressed: () {
                      createAccount();
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.already_have_account_login} ",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: AppStyles.bold16Primary.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryLight,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
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
    );
  }

  void createAccount() {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  }
}
