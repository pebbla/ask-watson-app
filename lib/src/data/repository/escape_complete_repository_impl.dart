import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/escape_complete.dart';
import 'package:ask_watson_app/src/domain/repository/escape_complete_repository.dart';


class EscapeCompleteRepositoryImpl extends EscapeCompleteRepository {
  
  final HttpClient _httpClient = HttpClient();

  // 탈출 완료 테마 조회
  Future<Map<ApiResponse, dynamic>> getEscapeCompletesByUserId(int userId) async {
    var response = await _httpClient.getRequest('/user​/${userId}​/escape-completes');
    if(response[ApiResponse.Result] == ApiStatus.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<EscapeComplete>((json) => EscapeComplete.fromJson(json)).toList();
    }
    return response;
  }

  // 탈출 완료 등록
  Future<Map<ApiResponse, dynamic>> createEscapeComplete(int userId, int themeId) async {
    var response = await _httpClient.postRequest('​/user​/${userId}​/themes​/${themeId}​/escape-completes', '');
    return response;
  }

  // 탈출 완료 삭제 
  Future<Map<ApiResponse, dynamic>> deleteEscapeComplete(int escapeCompleteId) async {
    var response = await _httpClient.deleteRequest('​/user​/escape-completes​/${escapeCompleteId}');
    return response;
  }

}