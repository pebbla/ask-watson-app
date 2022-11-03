import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/auth/finish_sign_up_screen.dart';
import 'package:ask_watson_app/src/presentation/widget/button.dart';
import 'package:ask_watson_app/src/presentation/widget/outline_input_border.dart';
import 'package:flutter/material.dart';

enum Gender {women, men}

class InsertUserInfoScreen extends StatefulWidget {

  @override
  State<InsertUserInfoScreen> createState() => _InsertUserInfoScreenState();
}

class _InsertUserInfoScreenState extends State<InsertUserInfoScreen> {

  bool canTapNext = true;
  Gender _gender = Gender.women;

  final TextEditingController _textControllerBirth = TextEditingController();
  final TextEditingController _textControllerNickName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: MyColor.grey)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('셜록, 당신에 대해 알려주세요', style: MyTextStyle.black21w600),
                Padding(padding: EdgeInsets.all(24)),
                _insertGenderWidget(context),
                Padding(padding: EdgeInsets.all(18)),
                _inputBirthWidget(),
                Padding(padding: EdgeInsets.all(18)),
                _inputNickNameWidget()
              ],
            ),
            _nextBtn()
          ],
        ),
      ),
    );
  }

  // 성별 입력
  Widget _insertGenderWidget(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('성별', style: MyTextStyle.black17w500),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  selectedTileColor: MyColor.black,
                  title: Text('여자'),
                  value: Gender.women,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as Gender;
                    });
                  },
                ),
              ),
              Flexible(
                flex: 3,
                child: RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                    title: Text('남자'),
                    value: Gender.men,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value as Gender;
                      });
                    }),
              ),
              Flexible(
                flex: 1,
                child: Container())
            ],
          ),
        ],
      ),
    );
  }

  // 생년월일 입력
  Widget _inputBirthWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('생년월일', style: MyTextStyle.black17w500),
          Padding(padding: EdgeInsets.all(6)),
          TextField(
            controller: _textControllerNickName,
            cursorColor: MyColor.grey,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                enabledBorder: enabledBorder(), focusedBorder: focusedBorder()),
          ),
        ],
      ),
    );
  }


  // 닉네임 입력
  Widget _inputNickNameWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('닉네임', style: MyTextStyle.black17w500),
          Padding(padding: EdgeInsets.all(6)),
          TextField(
            controller: _textControllerBirth,
            cursorColor: MyColor.grey,
            decoration: InputDecoration(
                enabledBorder: enabledBorder(), focusedBorder: focusedBorder()),
          ),
        ],
      ),
    );
  }

  // 다음으로 버튼
  Widget _nextBtn() {
    return canTapNext == true
        ? ButtonPrimaryWidget(text: '다음으로', onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FinishSignUpScreen()));
        })
        : ButtonDisabledWidget(text: '다음으로');
  }
  
}
