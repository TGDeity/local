import 'package:ders/202/oop_learn.dart';
import 'package:flutter/material.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({super.key});

  @override
  State<OopLearnView> createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {

  final FileDownload _fileDownload = FileDownload();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _fileDownload.downloadItem(null);
      }),
      body: Text('OopLearnView'),
    );
  }
}