import 'package:flutter/cupertino.dart';

class DarkModeService extends ChangeNotifier{
  bool _darkMode = false;

  set setDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  bool get getDarkModel => _darkMode;
}