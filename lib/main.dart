
import 'package:ask_watson_app/src/presentation/mypage/mypage_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';



void main() {
  KakaoSdk.init(nativeAppKey: '8c7b05953960c527e38fabb76c758817');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ask Watson',
      home: MypageScreen());
  }
}
