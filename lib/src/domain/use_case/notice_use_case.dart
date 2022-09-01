import 'package:ask_watson_app/src/domain/repository/notice_repository.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class NoticeUseCase {

  final NoticeRepository _repository;

  NoticeUseCase(this._repository);

  // 공지사항 리스트 조회
  Future<Map<ApiResponse, dynamic>> getNoticeList() async {
    var result = await _repository.getNoticeList();
    return result;
  }

  // 공지사항 단건 조회
  Future<Map<ApiResponse, dynamic>> getNoticeById(int noticeId) async {
    var result = await _repository.getNoticeById(noticeId);
    return result;
  }

}