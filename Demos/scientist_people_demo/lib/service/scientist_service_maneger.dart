import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:scientist_people_demo/Product/constatns.dart';
import 'package:scientist_people_demo/model/scientist_model.dart';

abstract class IScientistNetworkManager {
  IScientistNetworkManager();

  Future<List<ScientistModel>?> fetchItem();
  Future<dynamic> deleteScientistId(int index);
  toScientistModel(dynamic data);
}

class ScientistNetworkManager extends IScientistNetworkManager {
  final Dio dio;
  ScientistNetworkManager()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'http://192.168.1.223:3000/',
          contentType: 'application/json',
          validateStatus: (status) => true,
          
        ),
      );

  @override
  Future<List<ScientistModel>?> fetchItem() async {
    final response = await dio.get(ScientistNetworkPath.scientists.networkPath);
    try {
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => ScientistModel.fromJson(e)).toList();
        }
      } else {
        if (kDebugMode) {
          print('bağlantı yok');
        }
      }
      return null;
    } on DioException catch (exception) {
      if (kDebugMode) {
        print(exception.message);
      }
      return null;
    }
  }

  @override
  Future<dynamic> deleteScientistId(int index) async {
    var response = await dio.delete('${ScientistNetworkPath.scientists.networkPath}/$index');

    return response.data;
  }

  toScientistModel(dynamic data) => ScientistModel.fromJson(data);

}
