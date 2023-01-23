import 'package:ask_watson_app/src/config/theme/shadow.dart';
import 'package:ask_watson_app/src/presentation/auth/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(),
      child: Scaffold(
          body: SignUpView(),
        )
    );
  }
}


class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          _mainImage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _signUpKakaoBtn(context),
              _signUpNaverBtn(context),
              _signUpGoogleBtn(context)
            ],
          ),
        ],
      ),
    );
  }

  /// 메인 이미지
  Widget _mainImage(){
    return Container(
      padding: const EdgeInsets.all(24),
      child: Image.asset('assets/cover/main_cover.png'),
    );
  }


  /// 카카오 로그인하기 버튼
  Widget _signUpKakaoBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<SignUpViewModel>(context, listen: false).tabSignUpKakaoBtn(context),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [basicShadow],
          color: const Color.fromRGBO(255, 234, 0, 1),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Image.asset('assets/auth/kakao_logo_icon.png'),
      ),
    );
  }



  /// 네이버 로그인하기 버튼
  Widget _signUpNaverBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<SignUpViewModel>(context, listen: false).tabSignUpNaverBtn(context),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [basicShadow],
          color: const Color.fromRGBO(3, 199, 90, 1),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: SizedBox(
          width: 50,
          child: Image.asset('assets/auth/naver_logo_icon.png')
        ),
      ),
    );
  }

  /// 구글 로그인하기 버튼
  Widget _signUpGoogleBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<SignUpViewModel>(context, listen: false).tabSignUpGoogleBtn(context),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [basicShadow],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: SizedBox(
            width: 40, child: Image.asset('assets/auth/google_logo_icon.png')),
      ),
    );
  }
}
