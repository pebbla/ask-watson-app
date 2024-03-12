import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/check.dart';
import 'package:ask_watson_app/src/domain/repository/check_repository.dart';


class CheckRepositoryImpl extends CheckRepository {
  
  final HttpClient _httpClient = HttpClient();

  // 탈출 완료 테마 조회
  Future<Map<ApiResponse, dynamic>> getChecksByUserId(int userId) async {
    var response = await _httpClient.getRequest('/user/$userId/checks');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Check>((json) => Check.fromJson(json)).toList();
    }
    return response;
  }

  // 탈출 완료 등록
  Future<Map<ApiResponse, dynamic>> createCheck(int userId, int themeId) async {
    var response = await _httpClient.postRequest('/user/$userId/themes/$themeId/checks', null);
    return response;
  }

  // 탈출 완료 삭제 
  Future<Map<ApiResponse, dynamic>> deleteCheck(int checkId) async {
    var response = await _httpClient.deleteRequest("/user/checks/$checkId");
    return response;
  }

}