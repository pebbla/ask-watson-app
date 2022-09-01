import 'package:ask_watson_app/util/enum/api_response.dart';

abstract class LocationRepository {

  // 장소 리스트 조회
  Future<Map<ApiResponse, dynamic>> getLocationList();

}