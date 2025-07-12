import 'package:evently_app/utils/shared_preference.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  bool isDark = false;

  AppThemeProvider() {
    loadAppTheme();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    isDark = appTheme == ThemeMode.dark;
    saveAppTheme(isDark);
    notifyListeners();
  }

  Future<void> loadAppTheme() async {
    isDark = await getAppTheme();
    appTheme = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
