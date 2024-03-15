import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/repository/report_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/suggestion_repository_impl.dart';

class ReportUseCase {

  final ReportRepositoryImpl _repository;

  ReportUseCase(this._repository);

  // 카페 정보 수정 요청
  Future<Map<ApiResponse, dynamic>> createReport(int userId, int reviewId, String content) async {
    var result = await _repository.createReport(userId, reviewId, content);
    return result;
  }
}