import 'dart:math';

import 'package:flutter/material.dart';

class Answerbutton extends StatefulWidget {
  const Answerbutton({super.key, this.onNumber});
  final bool Function(int number)? onNumber;

  @override
  State<Answerbutton> createState() => _AnswerbuttonState();
}

class _AnswerbuttonState extends State<Answerbutton> {
  //bana bir random sayı dön. bu sayıyı kontrol edip sana sana cevap vericem bu cevaba göre buton rengini güncelle
  //eğer doğru ise yeşil yanlış ise kırmızı yap.
  Color? _backGroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: _backGroundColor),
      onPressed: () {
        final result = Random().nextInt(11);
        final response = widget.onNumber?.call(result) ?? false; //eğer null değilse datayı yolayacak ? anlamı.

        setState(() {
          _backGroundColor = response ? Colors.green : Colors.red;
        });
      },
      child: const Text('Answer 1'),
    );
  }
}
