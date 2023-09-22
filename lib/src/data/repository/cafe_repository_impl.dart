import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/domain/repository/cafe_repository.dart';

class CafeRepositoryImpl extends CafeRepository {

  final HttpClient _httpClient = HttpClient();

  // 카페 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getCafeList({bool isEnglishPossible = false, int locaitonId = 0}) async {
    String url = '/cafes';
    if(isEnglishPossible == true) {
      url += '?isEnglishPossible=true';
    }
    if(locaitonId > 0) {
        url += '&locationId=$locaitonId';
    }
    var response = await _httpClient.getRequest(url);
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Cafe>((json) => Cafe.fromJson(json)).toList();
    }
    return response;
  }


  // 카페 개별 조회
  @override
  Future<Map<ApiResponse, dynamic>> getCafeById(int cafeId) async {
    var response = await _httpClient.getRequest('/cafes/$cafeId');
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = Cafe.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }

  
  @override
  Future<Map<ApiResponse, dynamic>> getCafeListBySearch(String word) async {
    var response = await _httpClient.getRequest('/cafes?searchWord=$word');
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Cafe>((json) => Cafe.fromJson(json)).toList();
    }
    return response;
  }
}