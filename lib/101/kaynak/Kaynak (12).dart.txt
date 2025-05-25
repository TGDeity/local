import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
   IconLearnView({super.key});
   final iconsize = IconSizes();
   final iconColorsvar = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HELLO")),
      body: Column(
        children: [
          Icon(Icons.message_outlined,color: Theme.of(context).dividerTheme.color),
          IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
            color: iconColorsvar.flory,// IconColors.flory,
            iconSize: iconsize.iconLarge,
          ),
        ],
      ),
    );
  }
}

class IconSizes {
  final double  iconSmall = 40;
  final double  iconMedium = 50;
  final double  iconLarge = 60;
}

class IconColors {
  static Color iconBrown = Colors.brown; // Static metot kullanımı ile IconColors.iconBrown verisi alınabilir.
  final Color  iconRed = Colors.red; // final metot kullanımı ile IconColors.iconRed okunamaz, sınıfı çağırıp variable üzerinden alınabilir.  final iconColors = IconColors();
  final Color  iconGreen = Colors.green;
  final Color  iconBlue = Colors.blue;
  final Color flory = Color(0xffED617A);
}