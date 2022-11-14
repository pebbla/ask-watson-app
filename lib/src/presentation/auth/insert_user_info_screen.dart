import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/model/user.dart';
import 'package:ask_watson_app/src/data/repository/user_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/user_use_case.dart';
import 'package:ask_watson_app/src/presentation/auth/finish_sign_up_screen.dart';
import 'package:ask_watson_app/src/presentation/widget/button.dart';
import 'package:ask_watson_app/src/presentation/widget/outline_input_border.dart';
import 'package:ask_watson_app/util/date_time.dart';
import 'package:ask_watson_app/util/enum/gender.dart';
import 'package:flutter/material.dart';

class InsertUserInfoScreen extends StatefulWidget {
  final String phoneNum;

  const InsertUserInfoScreen({super.key, required this.phoneNum});

  @override
  State<InsertUserInfoScreen> createState() => _InsertUserInfoScreenState();
}

class _InsertUserInfoScreenState extends State<InsertUserInfoScreen> {
  final TextEditingController _textControllerBirth = TextEditingController();
  final TextEditingController _textControllerNickName = TextEditingController();

  final FocusNode _focusNodeBirth = FocusNode();

  bool canTapNext = true;
  Gender _gender = Gender.women;

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
              Flexible(flex: 1, child: Container())
            ],
          ),
        ],
      ),
    );
  }

  // 생년월일 입력
  Widget _inputBirthWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('생년월일', style: MyTextStyle.black17w500),
        const Padding(padding: EdgeInsets.all(6)),
        TextField(
          onTap: () => MyDateTime.showDatePicker(
            context: context,
            onDateTimeChanged: (newDate) {
              _textControllerBirth.text = newDate.toString();
            },
          ),
          focusNode: _focusNodeBirth,
          readOnly: true,
          controller: _textControllerBirth,
          cursorColor: MyColor.grey,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            enabledBorder: enabledBorder(),
            focusedBorder: focusedBorder(),
          ),
        ),
      ],
    );
  }

  // 닉네임 입력
  Widget _inputNickNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('닉네임', style: MyTextStyle.black17w500),
        const Padding(padding: EdgeInsets.all(6)),
        TextField(
          controller: _textControllerNickName,
          cursorColor: MyColor.grey,
          decoration: InputDecoration(
            enabledBorder: enabledBorder(),
            focusedBorder: focusedBorder(),
          ),
        ),
      ],
    );
  }

  // 다음으로 버튼
  Widget _nextBtn() {
    return canTapNext == true
        ? ButtonPrimaryWidget(
            text: '다음으로',
            onPressed: () async {
              UserUseCase _useCase = UserUseCase(UserRepositoryImpl());
              User user = User(
                  nickname: _textControllerNickName.text,
                  phoneNum: widget.phoneNum,
                  birth: _textControllerBirth.text,
                  marketingAgreeYn: false,
                  gender: _gender.convertString);

              Map<ApiResponse, dynamic> response = await _useCase.createUser(user);
              print(response);
              if (response[ApiResponse.Status] == ApiStatus.Success) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FinishSignUpScreen()));
                
              } else {
                print('회원가입 도중 에러가 발생하였습니다.');
                throw Error();
              }
            })
        : ButtonDisabledWidget(text: '다음으로');
  }
}
