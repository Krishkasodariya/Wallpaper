// import 'package:flutter/cupertino.dart';
// import 'package:wallpaper/Theme_SharedPrefrences.dart';
//
// class DarkThemeProvider with ChangeNotifier {
//   DarkThemePreference darkThemePreference = DarkThemePreference();
//   bool _darkTheme = false;
//
//   bool get darkTheme => _darkTheme;
//
//   set darkTheme(bool value) {
//     _darkTheme = value;
//     darkThemePreference.setDarkTheme(value);
//     notifyListeners();
//   }
//   void toggleDarkMode() {
//     _darkTheme = !_darkTheme;
//     notifyListeners();
//   }
// }
import 'package:flutter/foundation.dart';

class DarkModeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
