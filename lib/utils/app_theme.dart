import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      iconTheme: IconThemeData(color: AppColors.blackColor),
    ),
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    primaryColorLight: AppColors.whiteColor,
    primaryColorDark: AppColors.transparentClolr,
    textTheme: TextTheme(
      titleSmall: AppStyles.bold14Primary,
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.medium16Primary,
      headlineSmall: AppStyles.medium16Grey,
      titleMedium: AppStyles.medium16Black,
    ),
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
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      iconTheme: IconThemeData(color: AppColors.primaryLight),
    ),
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    primaryColorDark: AppColors.transparentClolr,

    textTheme: TextTheme(
      titleSmall: AppStyles.bold14PrimaryDark,
      headlineLarge: AppStyles.bold20White,
      headlineMedium: AppStyles.medium16White,
      headlineSmall: AppStyles.medium16White,
      titleMedium: AppStyles.medium16White,
    ),
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
