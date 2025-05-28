import 'package:flutter/material.dart';
import 'package:loginuidemo/Widgets/login_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))),
      
      home: LoginPageView());
  }
}