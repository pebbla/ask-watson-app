import 'package:ask_watson_app/src/data/model/user.dart';
import 'package:ask_watson_app/src/data/repository/user_repository_impl.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';


class UserUseCase {

  final UserRepositoryImpl _repository;

  UserUseCase(this._repository);


  // 카카오 토큰으로 로그인
  @override
  Future<Map<ApiResponse, dynamic>> signInByKakaoToken(String token) async {
    print('### user use case kakao token : $token');
    var result = await _repository.signInByKakaoToken(token);
    return result;
  }


  // 네이버 토큰으로 로그인
  @override
  Future<Map<ApiResponse, dynamic>> signInByNaverToken(String token) async {
    print('### user use case naver token : $token');
    var result = await _repository.signInByNaverToken(token);
    return result;
  }


  // 구글 토큰으로 로그인
  @override
  Future<Map<ApiResponse, dynamic>> signInByGoogleToken(String token) async {
    print('### user use case google token : $token');
    var result = await _repository.signInByGoogleToken(token);
    return result;
  }


  // 회원 가입
  @override
  Future<Map<ApiResponse, dynamic>> createUser(User user) async {
    var result = await _repository.createUser(user);
    return result;
  }


  // 회원 정보 수정
  @override
  Future<Map<ApiResponse, dynamic>> modifyUser(User user) async {
    var result = await _repository.modifyUser(user);
    return result;
  }


  // 회원 탈퇴
  @override
  Future<Map<ApiResponse, dynamic>> deleteUser(int userId) async {
    var result = await _repository.deleteUser(userId);
    return result;
  }

}