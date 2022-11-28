import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/model/heart.dart';
import 'package:ask_watson_app/src/domain/repository/heart_repository.dart';

import '../data_source/remote_data_source/http_client.dart';

class HeartRepositoryImpl extends HeartRepository {

  final HttpClient _httpClient = HttpClient();

  // 유저별 좋아요 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getHeartList(int userId) async {
    var response = await _httpClient.getRequest('​​/user​/$userId​/hearts');
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = Heart.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }


  // 좋아요 등록
  @override
  Future<Map<ApiResponse, dynamic>> createHeart(int userId, themeId) async {
    var response = await _httpClient.postRequest('​​/user​/{userId}​/themes​/{themeId}​/hearts', null);
    return response;
  }


  // 좋아요 해제
  @override
  Future<Map<ApiResponse, dynamic>> deleteHeart(int heartId) async {
    var response = await _httpClient.deleteRequest('​/user​/hearts​/{heartId}');
    return response;
  }

}