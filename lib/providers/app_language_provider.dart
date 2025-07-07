import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String languaege = 'en';

  void changeLanguage(String newLangueage) {
    if (languaege == newLangueage) {
      return;
    }
    languaege = newLangueage;
    notifyListeners();
  }
}
