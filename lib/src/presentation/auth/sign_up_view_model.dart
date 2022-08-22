import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class SignUpViewModel extends ChangeNotifier {

  /**
   * 카카오톡 열기
   */
  void tabSignUpKakaoBtn(BuildContext context) async {
    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
      getKakaoAccessToken();
    } catch (error) {
      print(error.toString());
    }
  }



  /**
   *  kakao accessToken 받아오기
   */
  void getKakaoAccessToken () async {
    var tokenManager = await TokenManagerProvider.instance.manager.getToken();
    print(tokenManager?.accessToken);
  }



  /**
   * 네이버 로그인
   */
  void tabSignUpNaverBtn(BuildContext context) async {
    NaverLoginResult res = await FlutterNaverLogin.logIn();
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    NaverAccessToken resa = await FlutterNaverLogin.currentAccessToken;
    print(resa.accessToken);
    print(resa.tokenType);
  }


} 