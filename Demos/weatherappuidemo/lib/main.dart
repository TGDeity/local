import 'package:flutter/material.dart';
import 'package:weatherappuidemo/product/colors.dart';
import 'package:weatherappuidemo/product/widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      title: 'Flutter Demo',
      theme: ThemeData(
        
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: UIColors.page_fffff,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: UIColors.page_48319d)),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
        
      ),
      home: MediaQuery.of(context).orientation == Orientation.portrait ? const HomePage() :  Scaffold(appBar: AppBar(),body: Center(child: Text('Landscape Mode'),) ,),
    );
  }


}
