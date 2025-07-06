import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final service = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api/',
      headers: {'Content-Type': 'application/json',
      'x-api-key': 'reqres-free-v1'},
      validateStatus: (status) => true,
    ),
  );
}



class ProjectDioClass1 {
  final serviceClass = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api/',
      headers: {'Content-Type': 'application/json',
      'x-api-key': 'reqres-free-v1'},
      validateStatus: (status) => true,
    ),
  );
}
