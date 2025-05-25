import 'package:flutter/material.dart';

class PaddingLearnView extends StatelessWidget {
  const PaddingLearnView({super.key});


  @override
  Widget build(BuildContext context) {
    const data = "PaddingLearn";
    return Scaffold(
      appBar: AppBar(title: const Text(data)),
      body: Padding(
        padding: ProjectPadding.pagePaddinghorizontal,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              child: Container(color: Colors.white, height: 100, width: 200),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Container(color: Colors.white, height: 100, width: 200),
            ),
            Padding(
              padding: ProjectPadding.pagePaddinghorizontal + ProjectPadding.pagePaddingvertical,
              child: const Text(data),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddinghorizontal = EdgeInsets.symmetric(horizontal: 20);
  static const pagePaddingvertical = EdgeInsets.symmetric(vertical: 10);
  
}