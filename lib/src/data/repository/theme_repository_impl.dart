import 'package:ask_watson_app/src/data/data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/theme.dart';
import 'package:ask_watson_app/src/domain/repository/theme_repository.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:ask_watson_app/util/enum/api_status.dart';

class ThemeRepositoryImpl extends ThemeRepository {

  final HttpClient _httpClient = HttpClient();

  // 조건별 테마 조회
  // TODO : 조건 설정 구현!
  @override
  Future<Map<ApiResponse, dynamic>> getThemeList() async {
    var response = await _httpClient.getRequest('/themes');
    if(response[ApiResponse.Result] == ApiResult.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Theme>((json) => Theme.fromJson(json)).toList();
    }
    return response;
  }


  // 카페별 테마 조회
  @override
  Future<Map<ApiResponse, dynamic>> getThemeListByCafeId(int cafeId) async {
    var response = await _httpClient.getRequest('/cafes/${cafeId}/themes');
    if(response[ApiResponse.Result] == ApiResult.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Theme>((json) => Theme.fromJson(json)).toList();
    }
    return response;
  }


  // 테마 단건 조회
  @override
  Future<Map<ApiResponse, dynamic>> getThemeById(int themeId) async {
    var response = await _httpClient.getRequest('/themes/${themeId}');
    if(response[ApiResponse.Result] == ApiResult.Success) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Theme>((json) => Theme.fromJson(json)).toList();
    }
    return response;
  }

}