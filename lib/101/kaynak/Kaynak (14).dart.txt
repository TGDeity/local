import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class IndicatorLearnView extends StatelessWidget {
  const IndicatorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Center(child: CircularProgressIndicator())]),
      body: Column(
        children: [
          LoadingIndicator(
            strokeWidth: 3,
            indicatorType: Indicator.pacman,
            colors: [
              Colors.white,
              Colors.amber,
              Colors.red,
              Colors.green,
              Colors.purple,
            ],
          ),
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}
