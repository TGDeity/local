import 'package:ders/202/theme/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTme = true;

  void changeTheme() {
    isLightTme = !isLightTme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTme ? CustomLightTheme().theme : ThemeData.dark();
}
