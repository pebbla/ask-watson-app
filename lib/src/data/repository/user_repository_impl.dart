import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/http_client.dart';
import 'package:ask_watson_app/src/data/model/user.dart';
import 'package:ask_watson_app/src/domain/repository/user_repository.dart';



class UserRepositoryImpl extends UserRepository {
  final HttpClient _httpClient = HttpClient();

  // 카카오 토큰으로 로그인
  @override
  Future<Map<ApiResponse, dynamic>> singInByKakaoToken(String token) async {
    var response = await _httpClient.postRequest('/kakao/signin', {"accessToken" : token});
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = User.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }


  // 회원 가입
  @override
  Future<Map<ApiResponse, dynamic>> createUser(User user) async {
    var response = await _httpClient.postRequest('/users', user);
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = User.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }


  // 회원 정보 수정
  @override
  Future<Map<ApiResponse, dynamic>> modifyUser(User user) async {
    var response = await _httpClient.putRequest('/users/${user.id}', user);
    if(response[ApiResponse.Status] == ApiStatus.Success) {
      response[ApiResponse.Data] = User.fromJson(response[ApiResponse.Data]);
    }
    return response;
  }


  // 회원 탈퇴
  @override
  Future<Map<ApiResponse, dynamic>> deleteUser(int userId) async {
    var response = await _httpClient.getRequest('/users/$userId');
    return response;
  }
}
