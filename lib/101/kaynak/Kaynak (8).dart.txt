import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: ColorsItems.sulu,
          width: 100,
          height: 100,),
      ),
    );
  }
}


class ColorsItems{
  static Color porchase = Color(0xffEDBF61);
  static Color sulu = Color.fromARGB(198, 237, 97, 1);
}