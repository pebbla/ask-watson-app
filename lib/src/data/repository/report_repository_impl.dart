import 'dart:convert';

import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/domain/repository/report_repository.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


class ReportRepositoryImpl extends ReportRepository {

  final HttpClient _httpClient = HttpClient();

  // 신고하기
  @override
  Future<Map<ApiResponse, dynamic>> createReport(int userId, int reviewId, String content) async {
    var response = await _httpClient.postRequest(
        '/user/$userId/reviews/$reviewId/reports',
        json.encode({"content": content}));
    return response;
  }

}