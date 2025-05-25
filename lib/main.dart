// ignore_for_file: unused_import
import 'dart:io';
import 'package:ders/101/app_bar.learn.dart';
import 'package:ders/101/button_learn.dart';
import 'package:ders/101/card_learn.dart';
import 'package:ders/101/color_learn.dart';
import 'package:ders/101/column_row_learn.dart';
import 'package:ders/101/container_sized_box_learn.dart';
import 'package:ders/101/custom_widget_learn.dart';
import 'package:ders/101/icon_learn.dart';
import 'package:ders/101/image_learn.dart';
import 'package:ders/101/indicator_learn.dart';
import 'package:ders/101/list_tile.learn.dart';
import 'package:ders/101/padding_learn.dart';
import 'package:ders/101/scaffold_learn.dart';
import 'package:ders/101/stack_learn.dart';
import 'package:ders/101/stateful_learn.dart';
import 'package:ders/101/stateless_learn.dart';
import 'package:ders/101/text_learn.dart';
import 'package:ders/demos/notes_example_view.dart';
import 'package:ders/demos/stack_demo_view.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  _isWindows();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1))),
        listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
        progressIndicatorTheme: ProgressIndicatorThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(shape: StadiumBorder())),
        iconTheme: IconThemeData(color: Colors.amber),
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ), //Projedeki tüm Cardlara etki eder.
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          // color: Colors.red
        ),
      ),
      home: StateFullLearnView(),
    );
  }
}


 _isWindows () {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Flutter Windows App'); // Pencere başlığını ayarla
    setWindowMinSize(const Size(360, 640)); // Minimum boyutu telefon boyutuna ayarla
    setWindowMaxSize(const Size(360, 640)); // Maksimum boyutu da aynı yaparak sabitle
    setWindowFrame(const Rect.fromLTWH(0, 0, 360, 640)); // Başlangıç boyutu (genişlik, yükseklik)
  }
}