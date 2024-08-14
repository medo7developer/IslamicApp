import 'package:flutter/material.dart';
import 'package:islamapp/utils/app_assets.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;

  get isDarkThemeEnabled => currentTheme == ThemeMode.dark;

  set newTheme(ThemeMode themeMode){
    currentTheme = themeMode;
  }

  String get mainBackground => isDarkThemeEnabled ? AppAssets.darkBackground : AppAssets.lightBackground;
}