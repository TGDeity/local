import 'package:ders/core/random_Image.dart';
import 'package:flutter/material.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title:  RandomImage(),
                //contentPadding: EdgeInsets.zero, ThemeData üzerinde MyApptan verdik burada ezmeye gerek yok projede standart olmalı.
                dense: true,
                leading: const Icon(Icons.chevron_left),
                subtitle: const Text("Merhaba"),
                trailing: Container(height: 20,color: Colors.red,child: SizedBox(child:  Icon(Icons.money_outlined))),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
