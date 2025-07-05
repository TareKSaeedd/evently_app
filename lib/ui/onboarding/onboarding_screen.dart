import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
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
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        centerTitle: true,
        toolbarHeight: height * 0.11,
        title: Image.asset('assets/images/onboarding_title.png'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/onboarding_body.png'),
            Text(
              AppLocalizations.of(context)!.personalize_your_experience,
              style: AppStyles.bold20Primary,
            ),
            SizedBox(height: height * 0.033),
            Text(
              AppLocalizations.of(
                context,
              )!.choose_your_preferred_theme_and_language_to_get_started_with_a_comfortable_tailored_experience_that_suits_your_style,
              style: AppStyles.medium16WBlack,
            ),
            SizedBox(height: height * 0.033),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.language, style: AppStyles.medium16WPrimary),
                Spacer(),
                ToggleSwitch(
                  minWidth: 70.0,
                  minHeight: 40.0,
                  // initialLabelIndex: selectedIndex,
                  totalSwitches: 2,
                  cornerRadius: 30.0,
                  activeBgColors: [
                    [const Color.fromARGB(126, 59, 124, 237)],
                    [const Color.fromARGB(126, 59, 124, 237)],
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: Colors.black,
                  customIcons: [
                    Icon(Icons.language, color: AppColors.primaryLight),
                    Icon(Icons.translate, color: AppColors.primaryLight),
                  ],
                  onToggle: (index) {
                    if (index == 0) {
                      languageProvider.changeLanguage('en');
                    } else {
                      languageProvider.changeLanguage('ar');
                    }
                  },
                ),
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
                Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
              },
              child: Text(AppLocalizations.of(context)!.lets_start, style: AppStyles.medius20White),
            ),
          ],
        ),
      ),
    );
  }
}
