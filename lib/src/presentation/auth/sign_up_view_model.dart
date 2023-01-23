import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/repository/user_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/user_use_case.dart';
import 'package:ask_watson_app/src/presentation/auth/accept_term_screen.dart';
import 'package:ask_watson_app/src/presentation/tab/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class SignUpViewModel extends ChangeNotifier {

  final UserUseCase userUseCase = UserUseCase(UserRepositoryImpl());

  /// 카카오톡 버튼 선택 시 동작
  void tabSignUpKakaoBtn(BuildContext context) async {
    String kakaoToken = await getKakaoAccessToken();
    signInByKakaoToken(context, kakaoToken);
  }


  ///  kakao accessToken 받아오기
  Future<String> getKakaoAccessToken() async {
    OAuthToken? token;
    try {
      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }
      // var tokenManager = await TokenManagerProvider.instance.manager.getToken();
      // return tokenManager!.accessToken;
      return token.accessToken;
    } catch (error) {
      debugPrint(error.toString());
      return '';
    }
  }


  ///  회원가입 or 로그인 by kakao token
  void signInByKakaoToken(BuildContext context, String kakaoToken) async {
    var response = await userUseCase.signInByKakaoToken(kakaoToken);
    
    if (response[ApiResponse.Status] == ApiStatus.Success) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const TabBarScreen()), (route) => false);
      print('메인화면으로 이동');
    } else if (response[ApiResponse.Status] == ApiStatus.NotFound) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptTermScreen()));
    }
  }


  /// 네이버 로그인
  void tabSignUpNaverBtn(BuildContext context) async {  
    // 정보 가져오기
    NaverLoginResult loginResult = await FlutterNaverLogin.logIn();
    NaverAccessToken accessToken = await FlutterNaverLogin.currentAccessToken;
    var response = await userUseCase.signInByNaverToken(accessToken.accessToken);

    if (response[ApiResponse.Status] == ApiStatus.Success) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const TabBarScreen()), (route) => false);
    } else if (response[ApiResponse.Status] == ApiStatus.NotFound) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptTermScreen()));
    }
  }


  /// 구글 로그인
  void tabSignUpGoogleBtn(BuildContext context) async {  
    // 정보 가져오기
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication authentication = await googleUser!.authentication;

    var response = await userUseCase.signInByGoogleToken(authentication.accessToken!);

    if (response[ApiResponse.Status] == ApiStatus.Success) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const TabBarScreen()), (route) => false);
    } else if (response[ApiResponse.Status] == ApiStatus.NotFound) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptTermScreen()));
    }
  }
} 
