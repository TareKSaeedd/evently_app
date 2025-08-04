import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const String themeKey = 'theme_key';
  static const String languageKey = 'language_key';
}

void saveAppTheme(bool isDark) async {
  final SharedPreferences prefsTheme = await SharedPreferences.getInstance();

  prefsTheme.setBool(SharedPreferencesKeys.themeKey, isDark);
}

Future<bool> getAppTheme() async {
  final SharedPreferences prefsTheme = await SharedPreferences.getInstance();

  var loadedTheme = prefsTheme.getBool(SharedPreferencesKeys.themeKey) ?? false;

  return loadedTheme;
}

void saveLanguage(bool isEN) async {
  final SharedPreferences prefsLanguage = await SharedPreferences.getInstance();
  prefsLanguage.setBool(SharedPreferencesKeys.languageKey, isEN);
}

Future<bool> getAppLanguage() async {
  final SharedPreferences prefsLanguage = await SharedPreferences.getInstance();

  var loadedLanguage = prefsLanguage.getBool(SharedPreferencesKeys.languageKey) ?? false;

  return loadedLanguage;
}
