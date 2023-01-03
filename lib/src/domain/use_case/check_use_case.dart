import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/repository/check_repository_impl.dart';


class CheckUseCase {

  final CheckRepositoryImpl _repository;

  CheckUseCase(this._repository);

  // 탈출 완료 테마 조회
  Future<Map<ApiResponse, dynamic>> getChecksByUserId(int userId) async {
    var result = await _repository.getChecksByUserId(userId);
    return result;
  }

  // 탈출 완료 등록
  Future<Map<ApiResponse, dynamic>> createCheck(int userId, int themeId) async {
    var result = await _repository.createCheck(userId, themeId);
    return result;
  }

  // 탈출 완료 삭제 
  Future<Map<ApiResponse, dynamic>> deleteCheck(int checkId) async {
    var result = await _repository.deleteCheck(checkId);
    return result;
  }

}