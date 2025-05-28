import 'package:ders/core/random_Image.dart';
import 'package:flutter/material.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final double _cardHeight = 50;
  final double _cardWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(bottom: _cardHeight / 2, child: RandomImage()),
                Positioned(
                  height: _cardHeight,
                  width: _cardWidth,
                  //right: 0,
                  //left: 0,
                  bottom: 0,
                  child: _cardCustom(),
                ),
              ],
            ),
          ),
          Spacer(flex: 6),
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(color: Colors.white, shape: RoundedRectangleBorder());
  }
}
