import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/location.dart';
import 'package:ask_watson_app/src/domain/repository/location_repository.dart';


class LocationRepositoryImpl extends LocationRepository {
  
  final HttpClient _httpClient = HttpClient();

  // 장소 리스트 조회
  @override
  Future<Map<ApiResponse, dynamic>> getLocationList() async {
    var response = await _httpClient.getRequest('/locations');
    if(response[ApiResponse.Result] == ApiStatus.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Location>((json) => Location.fromJson(json)).toList();
    }
    return response;
  }
}