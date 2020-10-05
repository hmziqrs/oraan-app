import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeMap = {
  "system": ThemeMode.system,
  "dark": ThemeMode.dark,
  "light": ThemeMode.light,
};

enum CacheKeys {
  theme,
}

class AppProvider extends ChangeNotifier {
  AppProvider() {
    this._initAsync();
  }

  SharedPreferences _prefs;

  bool _loading = true;
  ThemeMode _themeMode = ThemeMode.system;

  bool get loading => this._loading;
  ThemeMode get themeMode => this._themeMode;

  void _initAsync() async {
    await Future.delayed(Duration(milliseconds: 100));

    if (this._prefs == null) {
      this._prefs = await SharedPreferences.getInstance();
    }

    final cachedTheme = this._prefs.getString(CacheKeys.theme.toString());
    this._themeMode =
        cachedTheme == null ? themeMap["system"] : themeMap[cachedTheme];

    await Future.delayed(Duration(milliseconds: 1000));
    this._loading = false;
    notifyListeners();
  }

  void setTheme(ThemeMode newTheme) {
    if (this._themeMode == newTheme) {
      return;
    }
    this._themeMode = newTheme;
    notifyListeners();
    this._prefs.setString(
          CacheKeys.theme.toString(),
          newTheme.toString().split(".").last,
        );
  }
}
