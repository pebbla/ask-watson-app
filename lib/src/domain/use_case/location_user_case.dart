import 'package:ask_watson_app/src/data/repository/location_repository_impl.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


class LocationUseCase {
  
  final LocationRepositoryImpl _repository;

  LocationUseCase(this._repository);

  // 장소 리스트 조회
  Future<Map<ApiResponse, dynamic>> getLocationList() async {
    var result = await _repository.getLocationList();
    return result;
  }
}