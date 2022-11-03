import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';

enum ApiResponse {
  Result,
  StatusCode,
  Data,
  StatusMessage,
}

class ApiResponseHelper {
  static Future<Map<ApiResponse, dynamic>> buildResult(response) async {
    return {
      ApiResponse.StatusCode: response.statusCode,
      ApiResponse.Result : ApiStatusHelper.convertApiStatus(response.statusCode),
      ApiResponse.Data: response.data['data'],
      ApiResponse.StatusMessage: response.statusMessage
    };
  }
}
