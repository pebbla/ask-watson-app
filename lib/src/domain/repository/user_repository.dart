import 'package:ask_watson_app/src/data/model/user.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';

abstract class UserRepository {

  // 카카오 토큰으로 로그인
  Future<Map<ApiResponse, dynamic>> singInByKakaoToken(String token);

  // 회원 가입
  Future<Map<ApiResponse, dynamic>> createUser(User user);

  // 회원 정보 수정
  Future<Map<ApiResponse, dynamic>> modifyUser(User user);

  // 회원 탈퇴
  Future<Map<ApiResponse, dynamic>> deleteUser(int userId);

}