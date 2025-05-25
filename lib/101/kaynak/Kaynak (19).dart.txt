import 'package:ders/product/counter_button.dart';
import 'package:ders/product/language/language_Items.dart';
import 'package:flutter/material.dart';

class StateFullLearnView extends StatefulWidget {
  //Bu class sadece dışarıdan parametre alır. Data alma işi sağlanır.
  //Dışarı ile haberleşilen kısım.
  const StateFullLearnView({super.key});
  @override
  State<StateFullLearnView> createState() => _StateFullLearnViewState();
}

class _StateFullLearnViewState extends State<StateFullLearnView> {
  //Hayat burada belirlenir, kodlar yazılır.
  //Logic alanı.
  int _countValue = 0;
  final String _welcomeTitle = LanguageItems.welcomeTitle;

  void _updateCounter(bool isIncrement) {
    isIncrement ? _countValue++ : _countValue--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_welcomeTitle),),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [_increment(), _deIncrement()],
      ),

      body: Column(
        children: [
          Placeholder(),
          Center(child: Text(_countValue.toString(), style: Theme.of(context).textTheme.headlineLarge)),
          const CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _deIncrement() =>
      FloatingActionButton(onPressed: () => _updateCounter(false), child: Icon(Icons.remove));

  FloatingActionButton _increment() {
    print('burada');
    return FloatingActionButton(onPressed: () => _updateCounter(true), child: const Icon(Icons.add));
  }
}
