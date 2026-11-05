import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferencesController extends ChangeNotifier {
  AppPreferencesController(this._preferences);

  static const _localeKey = 'app_locale';
  static const _themeModeKey = 'app_theme_mode';

  final SharedPreferences _preferences;

  Locale _locale = const Locale('ar');
  ThemeMode _themeMode = ThemeMode.light;

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;

  Future<void> load() async {
    final languageCode = _preferences.getString(_localeKey);
    final themeModeName = _preferences.getString(_themeModeKey);

    if (languageCode == 'ar' || languageCode == 'en') {
      _locale = Locale(languageCode!);
    }
    if (themeModeName == ThemeMode.dark.name ||
        themeModeName == ThemeMode.light.name) {
      _themeMode = ThemeMode.values.byName(themeModeName!);
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (locale == _locale) return;
    _locale = locale;
    notifyListeners();
    await _preferences.setString(_localeKey, locale.languageCode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode) return;
    _themeMode = mode;
    notifyListeners();
    await _preferences.setString(_themeModeKey, mode.name);
  }
}
