import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class SuggestionRepository {

  // 카페 정보 수정 요청
  Future<Map<ApiResponse, dynamic>> createSuggestion(int userId, int cafeId, String content);
  
}
