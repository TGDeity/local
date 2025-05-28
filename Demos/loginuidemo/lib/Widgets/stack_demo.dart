import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(color: Colors.red, height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(color: Colors.amber, height: 100),
          ),
          Positioned(
            //right: 0,
            //left: 0,
            //top:25,
            bottom: 0,
            width: 25,
            height: 100,
            child: Container(color: Colors.green),
          ),
          Positioned.fill(
            //width, height propertysi yoktur. //Positioned.fill sahip olduğu yükseklik ve height kadar bütün ekranı kaplar. ancak kaplamayı bottom, top left width vs.. sınırlandırabiliriz.
            //right: 0,
            //left: 0,
            top: 100,
            bottom: 0,

            child: Container(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
