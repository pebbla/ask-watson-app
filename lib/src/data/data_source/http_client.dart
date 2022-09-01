import 'package:ask_watson_app/src/data/data_source/my_dio.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:ask_watson_app/util/enum/api_status.dart';
import 'package:ask_watson_app/util/enum/content_type.dart';
import 'package:logger/logger.dart';




class HttpClient {

  static final baseUrl = 'localhost:8080/v1';
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

    return buildResult(response);
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

    return buildResult(response);
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

    return buildResult(response);
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

    return buildResult(response);
  }



  ApiResult convertApiResult(int? statusCode) {
    switch(statusCode) {
      case 200 : 
      case 201 :
      case 202 :
        return ApiResult.Success;
      case 403 : 
        return ApiResult.Forbidden;
      case 404 : 
        return ApiResult.NotFound;
      case 406 : 
        return ApiResult.NotAcceptable;
      case 409 :
        return ApiResult.Conflict;
      case 422 : 
        return ApiResult.UnprocessableEntity;
      case 500 : 
        return ApiResult.InterverServerError;
      default : 
        return ApiResult.Error;
    }
  }


  Map<ApiResponse, dynamic> buildResult(response) {
    return {
      ApiResponse.StatusCode: response.statusCode,
      ApiResponse.Result : convertApiResult(response.statusCode),
      ApiResponse.Data: response.data['data'] == null ? response.data['dataList'] : response.data['data'],
      ApiResponse.StatusMessage: response.statusMessage
    };
  }
}