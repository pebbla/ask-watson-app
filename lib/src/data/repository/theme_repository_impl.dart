import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/theme.dart';
import 'package:ask_watson_app/src/domain/repository/theme_repository.dart';


class ThemeRepositoryImpl extends ThemeRepository {

  final HttpClient _httpClient = HttpClient();

  // 조건별 테마 조회
  // TODO : 조건 설정 구현!
  @override
  Future<Map<ApiResponse, dynamic>> getThemeList() async {
    // TODO : user 아이디 빼야한다.
    var response = await _httpClient.getRequest('/user/1/themes');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Theme>((json) => Theme.fromJson(json)).toList();
    }
    return response;
  }


  // 카페별 테마 조회
  @override
  Future<Map<ApiResponse, dynamic>> getThemeListByCafeId(int cafeId) async {
    // TODO : user 아이디 빼아한다.
    var response = await _httpClient.getRequest('/user/1/cafes/${cafeId}/themes');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Theme>((json) => Theme.fromJson(json)).toList();
    }
    return response;
  }


  // 테마 단건 조회
  @override
  Future<Map<ApiResponse, dynamic>> getThemeById(int themeId) async {
    var response = await _httpClient.getRequest('/themes/${themeId}');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = Theme.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }
  
  @override
  Future<Map<ApiResponse, dynamic>> getThemeListBySearch(String word) async {
    var response = await _httpClient.getRequest('/themes?searchWord=$word');
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      response[ApiResponse.Data] = response[ApiResponse.Data].map<Theme>((json) => Theme.fromJson(json)).toList();
    }
    return response;
  }

}