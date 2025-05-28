import 'package:flutter/material.dart';

class CustomWidgetLearnView extends StatelessWidget {
  const CustomWidgetLearnView({super.key});

  final String title = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: CustomFootButton(title: title,  onPressed: () {})),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomFootButton(title: title, onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

mixin _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
  static get arabaCagir => print('zumba');
}

mixin _ProjectPaddingUtily {
   final EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
   final EdgeInsets paddingVertical = EdgeInsets.symmetric(horizontal: 20);
   final EdgeInsets normalPadding = EdgeInsets.all(10);
}


/// CUSTOM FOOT BUTTON HER YERDE KULLANILABİLİYOR VE Tamamen dinamik yapıda oluşturuldu.
class CustomFootButton extends StatelessWidget with _ColorsUtility, _ProjectPaddingUtily {
  CustomFootButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: redColor),
      onPressed: () {
        _ColorsUtility.arabaCagir;
      },
      child: Padding(
        padding: normalPadding,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
