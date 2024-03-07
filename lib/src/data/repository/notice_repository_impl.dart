import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/notice.dart';
import 'package:ask_watson_app/src/domain/repository/notice_repository.dart';


class NoticeRepositoryImpl extends NoticeRepository {

  final HttpClient _httpClient = HttpClient();

  // 공지사항 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getNoticeList() async {
    var response = await _httpClient.getRequest('/notices');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Notice>((json) => Notice.fromJson(json)).toList();
    }
    return response;
  }


  // 공지시항 단건 조회
  @override
  Future<Map<ApiResponse, dynamic>> getNoticeById(int noticeId) async {
    var response = await _httpClient.getRequest('/notices/$noticeId');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = Notice.fromJson(response[ApiResponse.Data]);
    }
    return response;

  }

}

  