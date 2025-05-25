import 'package:flutter/material.dart';

class CardLearnView extends StatelessWidget {
  const CardLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            color: const Color.fromARGB(255, 170, 13, 13),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(child: Text("tTA")),
            ),
          ),
          Card(
            margin: ProjectMargins.cardMargin,
            color: Theme.of(context).colorScheme.error,
            shape: StadiumBorder(),
            child: SizedBox(width: 500, height: 100),
          ),
          _CustomCard(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(child: Text("tTA")),
            ),
          ),
        ],
      ),
    );
  }
}

//Borders
//StadiumBorder()
//CircleBorder()
//RoundedRectangleBorder()

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

class _CustomCard extends StatelessWidget {
  // CUSTOM CARD SADECE CARD İÇERMELİ İÇERİSİNDE KODLAR OLMAMALI!
  const _CustomCard({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(margin: ProjectMargins.cardMargin, child: child);
  }
}
