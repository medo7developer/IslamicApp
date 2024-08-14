import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islamapp/utils/app_colors.dart';

abstract class AppStyle{
  static const TextStyle appBarStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.accentColor);
  static const TextStyle titlesTextStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.w600);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: AppColors.primaryColor
          )
      )

  );

  static ThemeData darktTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primarDarkyColor)
      )
    ),

  );
}


