import 'package:flutter/material.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  const WidgetSizeEnumLearnView({super.key});

  @override
  State<WidgetSizeEnumLearnView> createState() => _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: SizedBox(height: WidgetSizes.normalCardHeight.value, width: WidgetSizes.circleProfileWitdh.value),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWitdh }

extension WidgetSizeExtension on WidgetSizes {
  double get value {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWitdh:
        return 25;
    }
  }
}
