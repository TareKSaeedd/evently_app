import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/widgets/language_switch.dart';
import 'package:evently_app/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.appTheme == ThemeMode.light
              ? AppColors.whiteBgColor
              : AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor:
            themeProvider.appTheme == ThemeMode.light
                ? AppColors.whiteBgColor
                : AppColors.primaryDark,
        centerTitle: true,
        toolbarHeight: height * 0.11,
        title: Image.asset(AppAssets.onboardingTitle),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: width * 0.816,
              height: height * 0.4,
              child:
                  themeProvider.appTheme == ThemeMode.light
                      ? Image.asset(AppAssets.onboardingBody)
                      : Image.asset(AppAssets.onboardingDarkBody),
            ),
            SizedBox(height: height * 0.033),
            Text(AppLocalizations.of(context)!.onboarding_title, style: AppStyles.bold20Primary),
            SizedBox(height: height * 0.033),
            Text(
              AppLocalizations.of(context)!.onboarding_description,
              style:
                  themeProvider.appTheme == ThemeMode.light
                      ? AppStyles.medium16Black
                      : AppStyles.medium16White,
            ),
            SizedBox(height: height * 0.033),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.language, style: AppStyles.medium16Primary),
                Spacer(),
                SizedBox(width: width * 0.18, height: height * 0.035, child: LanguageSwitch()),
              ],
            ),
            SizedBox(height: height * 0.019),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.theme, style: AppStyles.medium16Primary),
                Spacer(),
                SizedBox(width: width * 0.18, height: height * 0.035, child: ThemeSwitch()),
              ],
            ),
            SizedBox(height: height * 0.033),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLight,
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.onboardingRouteName);
              },
              child: Text(AppLocalizations.of(context)!.lets_start, style: AppStyles.medium20White),
            ),
          ],
        ),
      ),
    );
  }
}
