// ignore: file_names
import 'dart:io';

import 'package:ders/202/service/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


abstract class InterFacePostService {
    Future<List<PostModel>?> fetchPostItemsAdvance();
    Future<bool> addItemToService(PostModel postModel);
}


class PostService implements InterFacePostService {
  final Dio _networkManager;

  PostService()
    : _networkManager = Dio(
        BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/', headers: {'Content-Type': 'application/json'}),
      );

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _networkManager.post(_PostServicePath.posts.name, data: postModel.toJson());
      return response.statusCode == HttpStatus.created;
    } catch (e) {
      print(e);
      return false;
    }
  }
  
  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _networkManager.get(_PostServicePath.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }

    return null;
  }
}

enum _PostServicePath { posts, comments }
