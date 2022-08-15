import 'package:flutter/material.dart';
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
} 