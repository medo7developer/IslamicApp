import 'package:flutter/material.dart';
import 'package:islamapp/providers/language_provider.dart';
import 'package:islamapp/providers/theme_provider.dart';
import 'package:islamapp/utils/app_colors.dart';
import 'package:islamapp/utils/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static const String routeName = 'settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkThemeEnabled = false;
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider  = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: AppStyle.appBarStyle,
          ),
          buildLanguageDropDown(),
          buildThemeSwitch()
        ],
      ),
    );
  }

  Widget buildLanguageDropDown() => DropdownButton(
        isExpanded: true,
        value: languageProvider.locale,
        onChanged: (value) {
          languageProvider.locale = value ?? languageProvider.locale;
          languageProvider.notifyListeners();
          setState(() {});
        },
        items: [
          DropdownMenuItem(
            value: 'ar',
            child: Text('العربية'),
          ),
          DropdownMenuItem(
            value: 'en',
            child: Text('English'),
          ),
        ],
      );

  buildThemeSwitch() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: AppStyle.titlesTextStyle,
          ),
          Switch(
            value: themeProvider.isDarkThemeEnabled,
            activeColor: AppColors.primaryColor,
            onChanged: (value) {
              themeProvider.newTheme = value ? ThemeMode.dark : ThemeMode.light;
              themeProvider.notifyListeners();
            },
          ),
        ],
      );
}