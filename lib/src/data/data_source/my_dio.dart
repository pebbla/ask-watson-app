import 'package:dio/dio.dart';

enum DioType {Auth, None}

Future<Dio> myDio(DioType dioType) async {
  var dio = Dio();
  dio.interceptors.clear();
  dio.options.validateStatus = (status) =>  status! < 500;

  switch (dioType) {
    case DioType.Auth : 
      final accessToken = '';
      dio.options.headers['Authorization'] = 'Bearer ${accessToken}';
    break;

    case DioType.None : 
    break;
  }
  return dio;
}