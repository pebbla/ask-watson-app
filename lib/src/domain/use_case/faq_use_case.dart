import 'package:ask_watson_app/src/domain/repository/faq_repository.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


class FaqUseCase {

  final FaqRepository _repository;

  FaqUseCase(this._repository);

  // 자주묻는질문 리스트 조회
  Future<Map<ApiResponse, dynamic>> getFaqList() async {
    var result = await _repository.getFaqList();
    return result;
  }

  // 자주묻는질문 단건 조회
  Future<Map<ApiResponse, dynamic>> getFaqById(int faqId) async {
    var result = await _repository.getFaqById(faqId);
    return result;
  }



}