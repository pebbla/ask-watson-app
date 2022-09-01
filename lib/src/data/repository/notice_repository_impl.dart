import 'package:ask_watson_app/src/data/data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/notice.dart';
import 'package:ask_watson_app/src/domain/repository/notice_repository.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:ask_watson_app/util/enum/api_status.dart';

class NoticeRepositoryImpl extends NoticeRepository {

  final HttpClient _httpClient = HttpClient();

  // 공지사항 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getNoticeList() async {
    var response = await _httpClient.getRequest('/notices');
    if(response[ApiResponse.Result] == ApiResult.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Notice>((json) => Notice.fromJson(json)).toList();
    }
    return response;
  }


  // 공지시항 단건 조회
  @override
  Future<Map<ApiResponse, dynamic>> getNoticeById(int noticeId) async {
    var response = await _httpClient.getRequest('/notices/$noticeId');
    if(response[ApiResponse.Result] == ApiResult.Success) {
      response[ApiResponse.Data] = Notice.fromJson(response[ApiResponse.Data]);
    }
    return response;

  }

}

  