import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  int selectedTheme = 1;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return AnimatedToggleSwitch<int>.rolling(
      current: selectedTheme,
      values: [1, 2],
      onChanged:
          (value) => setState(() {
            selectedTheme = value;
            if (value == 1) {
              themeProvider.changeTheme(ThemeMode.light);
            } else {
              themeProvider.changeTheme(ThemeMode.dark);
            }
          }),
      iconBuilder: (value, isSelected) {
        return value == 1
            ? Image.asset(
              AppAssets.iconLightTheme,
              color: !isSelected ? AppColors.primaryLight : AppColors.whiteColor,
            )
            : Image.asset(
              AppAssets.iconDarkTheme,
              color: !isSelected ? AppColors.primaryLight : AppColors.whiteColor,
            );
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
