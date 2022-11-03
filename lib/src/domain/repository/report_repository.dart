import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


abstract class ReportRepository {

  // 신고하기
  Future<Map<ApiResponse, dynamic>> createReport(int userId, int reviewId, String content);
}