//Bir ekran olacak
//bu ekranda 3 button ve bunlara basınca renk değişimi olacak.
//seçilil olan button selected icon olsun.
import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backGroundColor;

  @override
  void initState() {
    super.initState();
    _backGroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);

    inspect(widget);
    if (widget.initialColor != _backGroundColor && widget.initialColor != null) {
      // yukarıdaki gibi değişiklik olduğunda burada yakalanabilir.
      changeBackgorunColor(widget.initialColor!);
    }
  }

  void changeBackgorunColor(Color color) {
    setState(() {
      _backGroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      appBar: AppBar(),
      body: Text('data'),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: [
          BottomNavigationBarItem(
            icon: _ColorContainer(color: Colors.red),
            label: 'Red',
          ),
          BottomNavigationBarItem(
            icon: _ColorContainer(color: Colors.yellow),
            label: 'Yellow',
          ),
          BottomNavigationBarItem(
            icon: _ColorContainer(color: Colors.blue),
            label: 'Blue',
          ),
        ],
      ),
    );
  }

  void _colorOnTap(int index) {
    if (index == _MyColors.red.index) {
      changeBackgorunColor(Colors.red);
    } else if (index == _MyColors.yellow.index) {
      changeBackgorunColor(Colors.yellow);
    } else if (index == _MyColors.blue.index) {
      changeBackgorunColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  final Color color;
  const _ColorContainer({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(width: 10, height: 10, color: color);
  }
}
