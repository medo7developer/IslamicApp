import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islamapp/utils/app_colors.dart';

abstract class AppStyle {
  static const TextStyle appBarStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.accentColor);
  static const TextStyle titlesTextStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primaryColor,
      textTheme: TextTheme(
        displayLarge: titlesTextStyle,
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: appBarStyle, centerTitle: true, elevation: 0));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primarDarkyColor,

    textTheme: TextTheme(
      displayLarge: titlesTextStyle.copyWith(color: AppColors.white),
    ),

    appBarTheme: AppBarTheme(
        titleTextStyle: appBarStyle, centerTitle: true, elevation: 0),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.white),
      ),
    ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.primaryDarkColor,
    //   selectedItemColor: AppColors.accentDarkColor,
    //   unselectedItemColor: AppColors.textDarkColor.withOpacity(0.7),
    // ),
  );
}
