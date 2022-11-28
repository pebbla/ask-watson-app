import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/my_dio.dart';
import 'package:logger/logger.dart';
import 'enum/content_type.dart';




class HttpClient {

  static final baseUrl = 'http://c6ba-2001-2d8-f028-4a14-301a-9c05-6fe2-b211.ngrok.io/v1';
  // static final baseUrl = 'http://localhost:8080/v1';
  Logger _logger = Logger();



  /**
   * get method 
   */
  Future<Map<ApiResponse, dynamic>> getRequest(String url,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var _dio = await myDio(dioType);
    var response = await _dio.get('${baseUrl}${url}');

    _logger.e('${baseUrl} ${url} + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }



  /**
   * post method 
   */
  Future<Map<ApiResponse, dynamic>> postRequest(String url, dynamic data,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var _dio = await myDio(dioType);
    var response = await _dio.post('${baseUrl}${url}', data: data);

    _logger.e('${baseUrl} ${url} + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }



  /**
   * put method 
   */
  Future<Map<ApiResponse, dynamic>> putRequest(String url, dynamic data,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var _dio = await myDio(dioType);
    var response = await _dio.put('${baseUrl}${url}', data: data);

    _logger.e('${baseUrl} ${url} + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }



  /**
   * delete method 
   */
  Future<Map<ApiResponse, dynamic>> deleteRequest(String url,
      {DioType dioType = DioType.None,
        ContentType contentType = ContentType.Json}) async {
    var _dio = await myDio(dioType);
    var response = await _dio.delete('${baseUrl}${url}');

    _logger.e('${baseUrl} ${url} + ${response.statusCode} + ${response.data} ');

    return ApiResponseHelper.buildResult(response);
  }

}