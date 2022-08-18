import 'package:ask_watson_app/util/enum/api_response.dart';

abstract class CafeRepository {

  // 카페 리스트 조회
  Future<Map<ApiResponse, dynamic>> getCafeList();

  // 카페 개별 조회
  Future<Map<ApiResponse, dynamic>> getCafeById(int cafeId);

}