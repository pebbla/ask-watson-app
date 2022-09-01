import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class ThemeUseCase {

  final ThemeRepositoryImpl _repository;

  ThemeUseCase(this._repository);

  // 조건별 테마 조회
  // TODO : 조건 설정 구현!
  Future<Map<ApiResponse, dynamic>> getThemeList() async {
    var result = await _repository.getThemeList();
    return result;
  }

  // 카페별 테마 조회
  Future<Map<ApiResponse, dynamic>> getThemeListByCafeId(int cafeId) async {
    var result = await _repository.getThemeListByCafeId(cafeId);
    return result;
  }

  // 테마 단건 조회
  Future<Map<ApiResponse, dynamic>> getThemeById(int themeId) async {
    var result = await _repository.getThemeById(themeId);
    return result;
  }

}