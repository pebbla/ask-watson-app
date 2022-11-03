import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';

abstract class LocationRepository {

  // 장소 리스트 조회
  Future<Map<ApiResponse, dynamic>> getLocationList();

}