import 'package:flutter/material.dart';


class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          print("Her liste iteminden sonra ne yapayım?");
          return Divider(color: Colors.amber);
        },
        
        itemBuilder: (BuildContext context, int index) {
        print(index);
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              Expanded(child: Image.network("https://picsum.photos/200")),
              Text(index.toString())
            ],
          ),
        );
      }, itemCount: 10),

    );
  }
}

