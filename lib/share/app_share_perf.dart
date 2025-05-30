import 'package:shared_preferences/shared_preferences.dart';

abstract class AppLocaleChanger {
  Future<void> setAppLocale(String locale);
  Future<String> getAppLocale();
}

abstract class AppThemeChanger {
  Future<void> setAppTheme(bool isDark);
  Future<bool> getAppTheme();
}

class AppSharePerf extends AppLocaleChanger implements AppThemeChanger {
  static const localKey = 'app_local';
  static const themeKey = 'app_theme';

  @override
  Future<void> setAppLocale(String locale) async {
    var sharePref = await SharedPreferences.getInstance();
    sharePref.setString(localKey, locale);
  }

  @override
  Future<String> getAppLocale() async {
    var sharePref = await SharedPreferences.getInstance();
    return sharePref.getString(localKey) ?? 'en';
  }

  @override
  Future<bool> getAppTheme() async {
    var sharePref = await SharedPreferences.getInstance();
    return sharePref.getBool(themeKey) ?? true;
  }

  @override
  Future<void> setAppTheme(bool isDark) async {
    var sharePref = await SharedPreferences.getInstance();
    sharePref.setBool(themeKey, isDark);
  }
}
