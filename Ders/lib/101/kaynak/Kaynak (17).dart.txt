import 'package:ders/101/container_sized_box_learn.dart';
import 'package:flutter/material.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scaffold')),
      body: Text("TG"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(context: context, builder: (context) => Container(height: 200,)),
        child: const Icon(Icons.arrow_back_sharp),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(child: Center(child: Text('Merhaba')),),
      
      bottomNavigationBar: Container(
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              
              icon: Icon(Icons.horizontal_split_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_sharp),
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
