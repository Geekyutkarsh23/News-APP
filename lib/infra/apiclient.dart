import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio();
  Future<Response> get(url) {
    return dio.get(url);
  }

  post(url, data){}
}