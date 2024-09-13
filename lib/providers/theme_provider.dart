import 'package:flutter/material.dart';
import 'package:islamapp/utils/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  late SharedPreferences storage;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  get isDarkThemeEnabled => currentTheme == ThemeMode.dark;

  set newTheme(ThemeMode themeMode) {
    currentTheme = themeMode;
    _saveThemeToPrefs();
    notifyListeners();
  }

  String get mainBackground =>
      isDarkThemeEnabled ? AppAssets.darkBackground : AppAssets.lightBackground;

  _loadThemeFromPrefs() async {
    storage = await SharedPreferences.getInstance();
    bool isDark = storage.getBool('isDarkTheme') ?? false;
    currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  _saveThemeToPrefs() async {
    storage = await SharedPreferences.getInstance();
    await storage.setBool('isDarkTheme', currentTheme == ThemeMode.dark);
  }
}
