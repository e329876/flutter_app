import 'package:dio/dio.dart';

class HttpClient {
  static HttpClient _instance;
  Dio dio;

  HttpClient._() {
    initDio();
  }

  static HttpClient getInstance() {
    if (_instance == null) {
      _instance = HttpClient._();
    }
    return _instance;
  }

  void initDio() {
    if (dio == null) {
      dio = new Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }
  }
}
