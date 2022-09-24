import 'package:ask_watson_app/src/data/model/user.dart';
import 'package:ask_watson_app/src/data/repository/user_repository_impl.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

class UserUseCase {

  final UserRepositoryImpl _repository;

  UserUseCase(this._repository);


  // 카카오 토큰으로 로그인
  @override
  Future<Map<ApiResponse, dynamic>> signInByKakaoToken(String token) async {
    print('### user use case kakao token : $token');
    var result = await _repository.singInByKakaoToken(token);
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