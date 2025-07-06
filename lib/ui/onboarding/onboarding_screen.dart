import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        centerTitle: true,
        toolbarHeight: height * 0.11,
        title: Image.asset(AppAssets.onboardingTitle),
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.05),
          Image.asset(AppAssets.onboardingBody1),
          SizedBox(height: height * 0.04),
          Text(AppLocalizations.of(context)!.onboarding_title1, style: AppStyles.bold20Primary),
          SizedBox(height: height * 0.04),
          Text(
            AppLocalizations.of(context)!.onboarding_description1,
            style: AppStyles.medium16Black,
          ),
        ],
      ),
    );
  }
}
