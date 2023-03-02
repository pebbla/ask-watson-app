import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/my_dio.dart';
import 'package:logger/logger.dart';
import 'enum/content_type.dart';




class HttpClient {

  static const baseUrl = 'http://d5d7-2001-2d8-f112-4793-f55d-7f85-c041-2f89.ngrok.io/v1';
  // static const baseUrl = 'http://localhost:8080/v1';
  final Logger _logger = Logger();



  /// get method 
  Future<Map<ApiResponse, dynamic>> getRequest(String url,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var dio = await myDio(dioType);
    var response = await dio.get('$baseUrl$url');

    _logger.e('$baseUrl $url + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }



  /// post method 
  Future<Map<ApiResponse, dynamic>> postRequest(String url, dynamic data,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var dio = await myDio(dioType);
    var response = await dio.post('$baseUrl$url', data: data);

    _logger.e('$baseUrl $url + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }



  /// put method 
  Future<Map<ApiResponse, dynamic>> putRequest(String url, dynamic data,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var dio = await myDio(dioType);
    var response = await dio.put('$baseUrl$url', data: data);

    _logger.e('$baseUrl $url + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }



  /// delete method 
  Future<Map<ApiResponse, dynamic>> deleteRequest(String url,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var dio = await myDio(dioType);
    var response = await dio.delete('$baseUrl$url');

    _logger.e('$baseUrl $url + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }

}