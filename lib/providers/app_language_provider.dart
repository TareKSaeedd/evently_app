import 'package:evently_app/utils/shared_preference.dart';
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String languaege = 'en';
  bool isArabic = false;

  AppLanguageProvider() {
    loadAppLanguage();
  }

  void changeLanguage(String newLangueage) {
    if (languaege == newLangueage) {
      return;
    }
    languaege = newLangueage;
    isArabic = languaege == 'ar';
    saveLanguage(isArabic);
    notifyListeners();
  }

  Future<void> loadAppLanguage() async {
    isArabic = await getAppLanguage();
    languaege = isArabic ? 'ar' : 'en';
    notifyListeners();
  }
}
