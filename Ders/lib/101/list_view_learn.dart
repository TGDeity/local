import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          FittedBox(child: Text('Merhaba', style: Theme.of(context).textTheme.headlineLarge, maxLines: 1)),
          Container(color: Colors.red, height: 300),
          Divider(color: Colors.amber, height: 50, radius: BorderRadiusGeometry.zero),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green, width: 300),
                Container(color: Colors.red, width: 300),
                Container(color: Colors.amber, width: 300),
                Container(color: Colors.green, width: 300),
                Container(color: Colors.red, width: 300),
                Container(color: Colors.amber, width: 300),
                
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              FittedBox(child: Text('Merhaba', style: Theme.of(context).textTheme.headlineLarge, maxLines: 1)),
          Container(color: Colors.red, height: 300),
          Divider(color: Colors.amber, height: 50, radius: BorderRadiusGeometry.zero),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green, width: 300),
                Container(color: Colors.red, width: 300),
                Container(color: Colors.amber, width: 300),
                Container(color: Colors.green, width: 300),
                Container(color: Colors.red, width: 300),
                Container(color: Colors.amber, width: 300),
                
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          _ListDemoState()

        ],
      ),
    );
  }
}


class _ListDemoState extends StatefulWidget {
  const _ListDemoState();

  @override
  State<_ListDemoState> createState() => __ListDemoStateState();
}

class __ListDemoStateState extends State<_ListDemoState> {

  @override
  void initState() {
    super.initState();
    print('initState tekiklendi _ListDemoState draw edildi.');
  }
  @override
  void dispose() {
    super.dispose();
    print('exit edildi');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}