import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPageviewBody extends StatelessWidget {
  OnboardingPageviewBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.index,
  });
  String imagePath;
  String title;
  String description;
  int index;

  @override
  Widget build(BuildContext context) {
    List<String> darkModeImagePath = [
      AppAssets.onboardingBody1,
      AppAssets.onboardingBodyDark2,
      AppAssets.onboardingBodyDark3,
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * 0.05),
          Image.asset(
            themeProvider.appTheme == ThemeMode.light ? imagePath : darkModeImagePath[index],
          ),
          SizedBox(height: height * 0.046),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.bold20Primary),
                SizedBox(height: height * 0.046),
                Text(
                  description,
                  style:
                      themeProvider.appTheme == ThemeMode.light
                          ? AppStyles.medium16Black
                          : AppStyles.medium16White,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
