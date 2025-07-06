import 'package:ders/product/navigator/navigator_routes.dart';
import 'package:flutter/material.dart';

class NavigateHomeView extends StatelessWidget {
  const NavigateHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          FloatingActionButton.large(
            heroTag: null,
            onPressed: () {
              Navigator.of(context).pushNamed('NavigateRoutesEnum.detail.path', arguments: "adc");
            },
            child: const Icon(Icons.not_accessible_outlined),
          ),
          FloatingActionButton.large(
            onPressed: () {
              Navigator.of(context).pushNamed(NavigateRoutesEnum.detail.path, arguments: "abc");
            },
            child: const Icon(Icons.accessibility_outlined),
          ),
        ],
      ),

      appBar: AppBar(title: Text(toString())),
    );
  }
}
