import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class CafeRepository {

  // 카페 리스트 조회
  Future<Map<ApiResponse, dynamic>> getCafeList();

  // 카페 개별 조회
  Future<Map<ApiResponse, dynamic>> getCafeById(int cafeId);

  // 카페 키워드 검색
  // TODO : 추후 수정
  Future<Map<ApiResponse, dynamic>> getCafeListBySearch(String word);
  

}