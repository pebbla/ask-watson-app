import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/tab/tab_bar_screen.dart';
import 'package:ask_watson_app/src/presentation/widget/button.dart';
import 'package:flutter/material.dart';

class FinishSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.maxFinite,
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('회원가입이 완료되었습니다!', style: MyTextStyle.black21w600),
            Column(
              children: [
                SizedBox(
                  width: 180,
                  child: Image.asset('assets/character/watson_yeah.png'),
                ),
                Padding(padding: EdgeInsets.all(12)),
                Text('같이 방탈출을 하러 가볼까요?', style: MyTextStyle.black16w500),
              ],
            ),
            //Image.asset('name')
            ButtonPrimaryWidget(
              text: '방탈출하러가기',
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TabBarScreen()), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
