import 'package:ask_watson_app/src/data/repository/user_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/user_use_case.dart';
import 'package:ask_watson_app/src/presentation/auth/accept_term_screen.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:ask_watson_app/util/enum/api_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class SignUpViewModel extends ChangeNotifier {

  final UserUseCase userUseCase = UserUseCase(UserRepositoryImpl());

  /**
   * 카카오톡 버튼 선택 시 동작
   */
  void tabSignUpKakaoBtn(BuildContext context) async {
    String kakaoToken = await getKakaoAccessToken();
    signInByKakaoToken(context, kakaoToken);
  }



  /**
   *  kakao accessToken 받아오기
   */
  Future<String> getKakaoAccessToken() async {
    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
      var tokenManager = await TokenManagerProvider.instance.manager.getToken();
      return tokenManager!.accessToken;
    } catch (error) {
      print(error.toString());
      return '';
    }
  }


  /**
   *  회원가입 or 로그인 by kakao token
   */
  void signInByKakaoToken(BuildContext context, String kakaoToken) async {
    var response = await userUseCase.signInByKakaoToken(kakaoToken);
    if (response[ApiResponse.Result] == ApiResult.Success) {
      // TODO : 메인 화면으로 이동
      print('메인화면으로 이동');
    } else if (response[ApiResponse.Result] == ApiResult.NotFound) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptTermScreen()));
    }
  }






  /**
   * 네이버 로그인
   */
  void tabSignUpNaverBtn(BuildContext context) async {  
    // 정보 가져오기
    NaverLoginResult loginResult = await FlutterNaverLogin.logIn();

    print(loginResult.account.email);
    print(loginResult.account.birthday);
    print(loginResult.account.nickname);
    print(loginResult.account.mobile);

    // 토근 가져오기 
    NaverAccessToken accessToken = await FlutterNaverLogin.currentAccessToken;
    print(accessToken.accessToken);
  }
} 