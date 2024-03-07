import 'package:ask_watson_app/src/domain/repository/cafe_repository.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


class CafeUseCase {

  final CafeRepository _repository;

  CafeUseCase(this._repository);

  // 카페 리스트 조회
  Future<Map<ApiResponse, dynamic>> getCafeList({bool isEnglishPossible = false, int locaitonId = 0}) async {
    var result = await _repository.getCafeList(isEnglishPossible: isEnglishPossible, locaitonId: locaitonId);
    return result;
  }


  // 카페 단건 조회
  Future<Map<ApiResponse, dynamic>> getCafeById(int cafeId) async {
    var result = await _repository.getCafeById(cafeId);
    return result;
  }

  
  // 카페 키워드 조회
    Future<Map<ApiResponse, dynamic>> getCafeListBySearch(String word) async {
    var result = await _repository.getCafeListBySearch(word);
    return result;
  }

}