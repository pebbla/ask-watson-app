import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


abstract class ThemeRepository {

  // 조건별 테마 조회
  // TODO : 조건 설정 구현!
  Future<Map<ApiResponse, dynamic>> getThemeList();

  // 카페별 테마 조회
  Future<Map<ApiResponse, dynamic>> getThemeListByCafeId(int cafeId);

  // 테마 단건 조회
  Future<Map<ApiResponse, dynamic>> getThemeById(int themeId);

  // 테마 키워드 검색
  Future<Map<ApiResponse, dynamic>> getThemeListBySearch(String word);
}