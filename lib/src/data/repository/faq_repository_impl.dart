import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/faq.dart';
import 'package:ask_watson_app/src/domain/repository/faq_repository.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


class FaqRepositoryImpl extends FaqRepository {

  final HttpClient _httpClient = HttpClient();

  // 자주묻는질문 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getFaqList() async {
    var response = await _httpClient.getRequest('/faqs');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Faq>((json) => Faq.fromJson(json)).toList();
    }
    return response;
  }
  
  
  // 자주묻는질문 개별 조회
  @override
  Future<Map<ApiResponse, dynamic>> getFaqById(int faqId) async {
    var response = await _httpClient.getRequest('/faqs/$faqId');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = Faq.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }

}
