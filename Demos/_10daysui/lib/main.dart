import 'package:_10daysui/product/langugae/language.dart';
import 'package:_10daysui/product/onbarding_screen.dart';
import 'package:_10daysui/product/uihelpers.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with Paddings {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectMediaQuery mq = ProjectMediaQuery(context: context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Language.appName,
      theme: _themeData(mq: mq),
      home: OnbardingScreenMobile(mqs: mq),
    );
  }

  ThemeData _themeData({required ProjectMediaQuery mq}) => ThemeData(
    extensions: [ToggleStyle(backgroundColor: Colorsui.colorsTransparent, indicatorColor: Colorsui.colorsTransparent)],
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colorsui.colors_ff5678)),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: Colorsui.colors_4a4d53,
        fontWeight: FontWeight.normal,
        fontSize: (mq.height + mq.width) * 0.015,
      ),
      headlineMedium: TextStyle(
        color: Colorsui.colors_493e8a,
        fontWeight: FontWeight.bold,
        fontSize: (mq.height + mq.width) * 0.023,
      ),
    ),
  );
}
