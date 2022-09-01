import 'package:ask_watson_app/src/presentation/auth/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(),
      child: Scaffold(
          appBar: AppBar(title: const Text('로그인')),
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
      child: Center(child: _signUpKakaoBtn(context)),
    );
  }

  /**
   * 카카오 로그인하기 버튼
   */
  Widget _signUpKakaoBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<SignUpViewModel>(context, listen: false).tabSignUpKakaoBtn(context),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 234, 0, 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          children: [
            Image.asset('assets/auth/kakao_logo_icon.png'),
            const Padding(padding: EdgeInsets.all(4)),
            const Text(
              '카카오 로그인하기',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}