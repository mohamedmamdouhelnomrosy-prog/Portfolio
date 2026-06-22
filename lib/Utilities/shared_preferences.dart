import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences get prefs => GetIt.instance.get<SharedPreferences>();
  static const String loginStatusKey = "loginStatus";
  static const String _theme = "theme";
  static const String menuModeKey = "menuMode";
  static const String _language = "language";

  static String? getLanguage() {
    return prefs.getString(_language);
  }

  static Future<void> setLanguage({required String lang}) async {
    await prefs.setString(_language, lang);
  }

  static Future<void> setTheme(bool themeValue) async {
    await prefs.setBool(_theme, themeValue);
  }

  static bool? getTheme() {
    return prefs.getBool(_theme);
  }

  static Future setMenuMode(bool menuModeValue) async =>
      await prefs.setBool(menuModeKey, menuModeValue);

  static bool getMenuMode() => prefs.getBool(menuModeKey) ?? false;
}
