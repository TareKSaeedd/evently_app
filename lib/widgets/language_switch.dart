import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  int selectedLang = 1;
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return AnimatedToggleSwitch<int>.rolling(
      current: selectedLang,
      values: [1, 2],
      onChanged:
          (value) => setState(() {
            selectedLang = value;
            if (value == 1) {
              languageProvider.changeLanguage('en');
            } else {
              languageProvider.changeLanguage('ar');
            }
          }),
      iconBuilder: (value, isSelected) {
        return value == 1 ? Image.asset(AppAssets.usaFlag) : Image.asset(AppAssets.egFlag);
      },
      style: ToggleStyle(
        borderColor: AppColors.primaryLight,
        indicatorColor: AppColors.primaryLight,
        backgroundColor:
            themeProvider.appTheme == ThemeMode.light
                ? AppColors.whiteColor
                : AppColors.primaryDark,
      ),
    );
  }
}
