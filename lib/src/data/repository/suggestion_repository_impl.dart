import 'dart:convert';

import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/suggestion.dart';
import 'package:ask_watson_app/src/domain/repository/suggestion_repository.dart';


class SuggestionRepositoryImpl extends SuggestionRepository {
  
  final HttpClient _httpClient = HttpClient();

  // 카페 정보 수정 요청
  @override
  Future<Map<ApiResponse, dynamic>> createSuggestion(int userId, int cafeId, String content) async {
    var response = await _httpClient.postRequest('/user/$userId/cafes/$cafeId/suggestions', json.encode({'content' : content}));
    if(response[ApiResponse.Status] == ApiStatus.OK || response[ApiResponse.Status] == ApiStatus.Created) {
      response[ApiResponse.Data] = Suggestion.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }



}