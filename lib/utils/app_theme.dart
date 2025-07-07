import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(headlineLarge: AppStyles.bold20Black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLight,
      selectedItemColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.whiteColor, width: 4),
        borderRadius: BorderRadius.circular(75),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: TextTheme(headlineLarge: AppStyles.bold20White),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      selectedItemColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.whiteColor, width: 4),
        borderRadius: BorderRadius.circular(75),
      ),
    ),
  );
}
