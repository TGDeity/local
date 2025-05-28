//Bir ekran olacak
//bu ekranda 3 button ve bunlara basınca renk değişimi olacak.
//seçilil olan button selected icon olsun.
import 'package:flutter/material.dart';


class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key});

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('data'),
      bottomNavigationBar: BottomNavigationBar(items:  [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red,),label: 'Red'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow,),label: 'Yellow'),
      ]),
    );
  }
}

class _ColorContainer extends StatelessWidget {
  final Color color;
  const _ColorContainer({
    super.key, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: 10,height: 10,color: color,);
  }
}