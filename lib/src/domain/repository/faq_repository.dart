import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class FaqRepository {

  // 자주묻는질문 리스트 조회
  Future<Map<ApiResponse, dynamic>> getFaqList();

  // 자주묻는질문 개별 조회
  Future<Map<ApiResponse, dynamic>> getFaqById(int faqId);

}