
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/repository/heart_repository_impl.dart';

class HeartUseCase {

  final HeartRepositoryImpl _repository;

  HeartUseCase(this._repository);


  // 유저별 좋아요 리스트 조회
  Future<Map<ApiResponse, dynamic>> getHeartList(int userId) async {
    var response = await _repository.getHeartList(userId);
    return response;
  }


  // 좋아요 등록
  Future<Map<ApiResponse, dynamic>> createHeart(int userId, themeId) async {
    var response = await _repository.createHeart(userId, themeId);
    return response;
  }


  // 좋아요 해제
  Future<Map<ApiResponse, dynamic>> deleteHeart(int heartId) async {
    var response = await _repository.deleteHeart(heartId);
    return response;
  }
}