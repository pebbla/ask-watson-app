import 'package:ask_watson_app/src/data/data_source/http_client.dart';
import 'package:ask_watson_app/src/domain/repository/report_repository.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class ReportRepositoryImpl extends ReportRepository {

  final HttpClient _httpClient = HttpClient();

  // 신고하기
  @override
  Future<Map<ApiResponse, dynamic>> createReport(int userId, int reviewId, String content) async {
    var response = await _httpClient.postRequest(
        '/user/{userId}/reviews/{reviewId}/reports',
        '{"userId" : $userId, "reviewId" : $reviewId, "content": $content}');
    return response;
  }

}