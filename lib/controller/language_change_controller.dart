import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale? _appLocale;
  int _clickCount = 0;

  Locale? get appLocale => _appLocale;
  int get clickCount => _clickCount;

  LanguageChangeController(this._appLocale);

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (type == const Locale('en')) {
      _appLocale = type;
      await sp.setString('language_code', 'en');
    } else if (type == const Locale('ar')) {
      _appLocale = type;
      await sp.setString('language_code', 'ar');
    } else {
      _appLocale = type;
      await sp.setString('language_code', 'hi');
    }
    notifyListeners();
  }

  void incrementClickCount() {
    _clickCount++;
    notifyListeners();
  }
}
