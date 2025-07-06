import 'dart:io';


import 'package:ders/303/request_resource/model/resoruce_model.dart';
import 'package:ders/product/service/project_dio_maneger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class IReqresService with ChangeNotifier {
  IReqresService(this.diotg);
  final Dio diotg;

  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqResPath { unknown }

class ReqresService extends IReqresService with ProjectDioMixin {
  ReqresService(super.diotg);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await diotg.get('/unknown');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
