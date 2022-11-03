import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class NoticeRepository {

  // 공지사항 리스트 조회
  Future<Map<ApiResponse, dynamic>> getNoticeList();

  // 공지시항 단건 조회
  Future<Map<ApiResponse, dynamic>> getNoticeById(int noticeId);
}