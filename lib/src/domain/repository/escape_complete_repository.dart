import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class EscapeCompleteRepository {


  // 탈출 완료 테마 조회
  Future<Map<ApiResponse, dynamic>> getEscapeCompletesByUserId(int userId);

  // 탈출 완료 등록
  Future<Map<ApiResponse, dynamic>> createEscapeComplete(int userId, int themeId);

  // 탈출 완료 삭제 
  Future<Map<ApiResponse, dynamic>> deleteEscapeComplete(int escapeCompleteId);
  
}
