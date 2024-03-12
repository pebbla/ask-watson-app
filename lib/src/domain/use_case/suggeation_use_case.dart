import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/repository/suggestion_repository_impl.dart';

class SuggestionUseCase {

  final SuggestionRepositoryImpl _repository;

  SuggestionUseCase(this._repository);

  // 카페 정보 수정 요청
  Future<Map<ApiResponse, dynamic>> createSuggestion(int userId, int cafeId, String content) async {
    var result = await _repository.createSuggestion(userId, cafeId, content);
    return result;
  }
}