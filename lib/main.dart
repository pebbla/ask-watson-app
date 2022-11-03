import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/presentation/provider/app_set_up.dart';
import 'package:ask_watson_app/src/presentation/tab/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '8c7b05953960c527e38fabb76c758817');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SetUp()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith((states) => MyColor.black)
            )),
        home: MyStatefulWidget(),
      ),
    );
  }
}
