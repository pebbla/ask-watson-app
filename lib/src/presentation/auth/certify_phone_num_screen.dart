import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/widget/button.dart';
import 'package:ask_watson_app/src/presentation/widget/outline_input_border.dart';
import 'package:flutter/material.dart';

class CertifyPhoneNumScreen extends StatefulWidget {
  @override
  State<CertifyPhoneNumScreen> createState() => _CertifyPhoneNumScreenState();
}

class _CertifyPhoneNumScreenState extends State<CertifyPhoneNumScreen> {
  final TextEditingController _textControllerPhoneNum = TextEditingController();
  final TextEditingController _textControllerCertifyNum =
      TextEditingController();

  bool canInput = false;
  bool canTapNext = false;

  @override
  void dispose() {
    _textControllerPhoneNum.dispose();
    _textControllerCertifyNum.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: MyColor.grey)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topText(),
                Padding(padding: EdgeInsets.all(24)),
                _inputPhoneNumWidget(),
                Padding(padding: EdgeInsets.all(6)),
                _sendTextBtn(),
                Padding(padding: EdgeInsets.all(6)),
                _inputCertifyNumWidget(),
              ],
            ),
            _nextBtn()
          ],
        ),
      ),
    );
  }

  // 상단 설명
  Widget _topText() {
    return Text(
      '셜록, 반가워요! \n핸드폰 번호를 인증해주세요.',
      style: MyTextStyle.black21w600,
    );
  }

  // 핸드폰 번호 입력 text field
  Widget _inputPhoneNumWidget() {
    return TextField(
      controller: _textControllerPhoneNum,
      cursorColor: MyColor.grey,
      decoration: InputDecoration(
          enabledBorder: enabledBorder(), focusedBorder: focusedBorder()),
    );
  }

  // 인증번호 전송 버튼
  Widget _sendTextBtn() {
    return ButtonWhiteWidget(
      text: '인증문자 받기',
      onPressed: () {
        setState(() {
          canInput = !canInput;
        });
      },
    );
  }

  // 인증번호 입력 text field
  Widget _inputCertifyNumWidget() {
    return canInput == false
        ? AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _textControllerCertifyNum,
                  cursorColor: MyColor.grey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: enabledBorder(),
                      focusedBorder: focusedBorder()),
                ),
                Padding(padding: EdgeInsets.all(6)),
                Text(
                  '※ 다른 사람에게 절대 알려주시면 안돼요!',
                  style: MyTextStyle.grey14w500,
                ),
              ],
            ),
          )
        : Container();
  }

  // 다음으로 버튼
  Widget _nextBtn() {
    return canTapNext == true
        ? ButtonPrimaryWidget(text: '다음으로', onPressed: () {})
        : ButtonDisabledWidget(text: '다음으로');
  }
}
