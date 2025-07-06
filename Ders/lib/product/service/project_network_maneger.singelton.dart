import 'package:dio/dio.dart';

class ProjectNetworkManeger {
  ProjectNetworkManeger._() {
    _dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  }

  late final Dio _dio;

  static ProjectNetworkManeger instance = ProjectNetworkManeger._();
  Dio get serviceManeger => _dio;

  void addBaseHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": "Bearer $token"});
  }
}



class DurationManeger {
  DurationManeger._();
  static DurationManeger? _manager;

  static DurationManeger get manager {
    if(_manager != null) return _manager!;
    _manager = DurationManeger._();
    return _manager!;

  }
  
}