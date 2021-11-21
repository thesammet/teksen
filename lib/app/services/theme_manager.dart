import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff252525),
    brightness: Brightness.dark,
    primaryColor: const Color(0xff252525),
    appBarTheme: AppBarTheme(backgroundColor: const Color(0xff303030)),
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF8F8F8),
    brightness: Brightness.light,
    primaryColor: const Color(0xffF8F8F8),
    appBarTheme: AppBarTheme(backgroundColor: const Color(0xffFFFFFF)),
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
