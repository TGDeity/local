
import 'dart:io';

import 'package:ders/202/service/.service_old/post_model.dart';
import 'package:ders/202/service/.service_old/post_service_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  
  //Test edilebilir KOD BAŞLADI
  late final InterFacePostService _postService;

  @override
  void initState() {
    super.initState();
    //fetchPostItems();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl, headers: {'Content-Type': 'application/json'}));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    var response = await Dio().get(
      'https://jsonplaceholder.typicode.com/posts',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        _items = datas.map((e) => PostModel.fromJson(e)).toList();
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    //öNERİLEN
    _changeLoading();
   
    //_items =  await _postService.fetchPostItemsAdvance();
    
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TG'), leading: _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index]);
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({required PostModel? model}) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(title: Text(_model?.title ?? ''), subtitle: Text(_model?.body ?? '')),
    );
  }
}
