import 'dart:io';

import 'package:ders/202/service/.service_old/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  late final Dio _networkManager;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  bool _isLoading = false;



  @override
  void initState() {
    super.initState();

    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl, headers: {'Content-Type': 'application/json'}));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManager.post('posts', data: postModel.toJson());
    if (response.statusCode == HttpStatus.created) {
     setState(() {
        name = 'Basarili';
     });
  
    }else {
 print('Basarisiz ${response.statusCode}');
    }
     

    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _bodyController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Body'),
          ),
          TextField(
            controller: _userIdController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.birthday],
            inputFormatters: [],
            decoration: InputDecoration(labelText: 'UserId'),
          ),
          TextButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final model = PostModel(
                        body: _bodyController.text,
                        title: _titleController.text,
                        userId: int.parse(_userIdController.text),
                      );
                      _addItemToService(model);
                    }
                  },
            child: Text(name ?? 'OKiDoKİ'),
          ),
        ],
      ),
    );
  }
}
