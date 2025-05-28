import 'package:ders/101/icon_learn.dart';
import 'package:ders/101/stack_learn.dart';
import 'package:flutter/material.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          Text(_currentPageIndex.toString()),
          Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(duration: _DurationUtilty.durationLow, curve: Curves.linearToEaseOut);
            },
            child: Icon(Icons.arrow_right_alt_outlined),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(duration: _DurationUtilty.durationLow, curve: Curves.linearToEaseOut);
            },
            child: Icon(Icons.arrow_left_outlined),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        controller: _pageController, //ikinci sayfayı azıcık gösteriyor sağdan.
        padEnds: false, //Başlangıç sayfasında sol taraftaki boşluğu siler.
        onPageChanged: _updatePageIndex,
        children: [
          IconLearnView(),
          StackLearn(),
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.purple),
        ],
      ),
    );
  }
}

class _DurationUtilty {
  static const Duration durationLow = Duration(seconds: 1);
}
