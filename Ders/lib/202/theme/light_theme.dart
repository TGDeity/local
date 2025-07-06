import 'package:flutter/material.dart';

class CustomLightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;
  CustomLightTheme() {
    theme = ThemeData.light(useMaterial3: true).copyWith(
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(onPrimary: _LightColor().blueMenia, onSecondary: Colors.red),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(Colors.amber),
        side: BorderSide(style: BorderStyle.solid),
      ),
      colorScheme: ColorScheme.light(),
      primaryTextTheme: TextTheme().apply(displayColor: Colors.red),
      textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: TextStyle(fontSize: 25, color: _lightColor._textColor),
      ),
    );
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 148, 33, 33);
  final Color blueMenia = Color.fromARGB(95, 188, 248, 1);
}
