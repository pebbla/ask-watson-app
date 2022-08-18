import 'package:ask_watson_app/src/data/data_source/http_client.dart';
import 'package:ask_watson_app/src/domain/repository/cafe_repository.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class CafeRepositoryImpl extends CafeRepository {

  final HttpClient _httpClient = HttpClient();

  // 카페 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getCafeList() async {
    var response = await _httpClient.getRequest('/v1/cafes');
    return response;
  }


  // 카페 개별 조회
  @override
  Future<Map<ApiResponse, dynamic>> getCafeById(int cafeId) async {
    var response = await _httpClient.getRequest('/v1/cafes/$cafeId');
    return response;
  }


}