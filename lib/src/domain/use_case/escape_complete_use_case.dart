import 'package:ask_watson_app/src/data/repository/escape_complete_repository_impl.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class EscapeCompleteUseCase {

  final EscapeCompleteRepositoryImpl _repository;

  EscapeCompleteUseCase(this._repository);

  // 탈출 완료 테마 조회
  Future<Map<ApiResponse, dynamic>> getEscapeCompletesByUserId(int userId) async {
    var result = await _repository.getEscapeCompletesByUserId(userId);
    return result;
  }

  // 탈출 완료 등록
  Future<Map<ApiResponse, dynamic>> createEscapeComplete(int userId, int themeId) async {
    var result = await _repository.createEscapeComplete(userId, themeId);
    return result;
  }

  // 탈출 완료 삭제 
  Future<Map<ApiResponse, dynamic>> deleteEscapeComplete(int escapeCompleteId) async {
    var result = await _repository.deleteEscapeComplete(escapeCompleteId);
    return result;
  }

}