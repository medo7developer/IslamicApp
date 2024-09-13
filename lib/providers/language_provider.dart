import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String locale = 'en';
  late SharedPreferences storage;

  LanguageProvider() {
    _loadLanguageFromPrefs();
  }

  set newLocale(String newLocale) {
    locale = newLocale;
    _saveLanguageToPrefs();
    notifyListeners();
  }

  _loadLanguageFromPrefs() async {
    storage = await SharedPreferences.getInstance();
    locale = storage.getString('appLanguage') ?? 'en';
    notifyListeners();
  }

  _saveLanguageToPrefs() async {
    storage = await SharedPreferences.getInstance();
    await storage.setString('appLanguage', locale);
  }
}
