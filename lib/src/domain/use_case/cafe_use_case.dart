import 'package:ask_watson_app/src/domain/repository/cafe_repository.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class CafeUseCase {

  final CafeRepository _repository;

  CafeUseCase(this._repository);

  // 카페 리스트 조회
  Future<Map<ApiResponse, dynamic>> getCafeList() async {
    var result = await _repository.getCafeList();
    return result;
  }


  // 카페 단건 조회
  Future<Map<ApiResponse, dynamic>> getCafeById(int cafeId) async {
    var result = await _repository.getCafeById(cafeId);
    return result;
  }

}