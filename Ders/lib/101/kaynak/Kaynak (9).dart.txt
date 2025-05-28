import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, //min değerinde ike padding widgetleri çalışır maxte çalışmaz.
              children: [
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
                Expanded(child: FlutterLogo()),
                 Expanded(child: FlutterLogo()),
                  Expanded(child: FlutterLogo()),
              ],
            ),
          ),
          Expanded(flex: 4, child: FlutterLogo()),
          Spacer(),
          Expanded(child: FlutterLogo()),
          Spacer(),
          Expanded(child: FlutterLogo()),
          Expanded(child: FlutterLogo()),
        ],
      ),
    );
  }
}
