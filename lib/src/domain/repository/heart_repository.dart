import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class HeartRepository {

  // 유저벌 좋아요 리스트 조회
  Future<Map<ApiResponse, dynamic>> getHeartList(int userId);

  // 좋아요 등록
  Future<Map<ApiResponse, dynamic>> createHeart(int userId, themeId);

  // 좋아요 해제
  Future<Map<ApiResponse, dynamic>> deleteHeart(int heartId);

}

