import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/cafe_detail/cafe_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModifyDialogWidget extends StatefulWidget {
  final Function onPressed;
  final TextEditingController controller;

  const ModifyDialogWidget({super.key, required this.onPressed, required this.controller});

  @override
  State<ModifyDialogWidget> createState() => _ModifyDialog();
}

class _ModifyDialog extends State<ModifyDialogWidget> {
  int check = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text('카페 정보 업데이트 요청', style: MyTextStyle.black21w600)),
      content: _buildBody(),
      actionsAlignment: MainAxisAlignment.center,
      actions: _buildActions()
    );
  }

  /**
   *  cafe 건의 내용 선택
   */
  Widget _buildBody() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Radio<int>(
                groupValue: check,
                onChanged: (value) {
                  check = value!;
                  setState(() {});
                },
                value: 1,
              ),
              const Text("카페 정보를 업데이트 해주세요!"),
            ],
          ),
          Row(
            children: [
              Radio<int>(
                groupValue: check,
                onChanged: (value) {
                  check = value!;
                  setState(() {});
                },
                value: 2,
              ),
              const Text("테마 정보를 업데이트 해주세요!"),
            ],
          ),
          Row(
            children: [
              Radio<int>(
                groupValue: check,
                onChanged: (value) {
                  check = value!;
                  setState(() {});
                },
                value: 3,
              ),
              const Text("직접입력"),
            ],
          ),
          SizedBox(
            width: 400,
            child: TextField(
              controller: widget.controller,
              enabled: check == 3 ? true : false,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: '업데이트되었으면 하는 부분을 입력해주세요!',
                hintStyle: MyTextStyle.grey14w500,
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      );
  }

  
  /**
   * 건의 취소, 등록 버튼
   */
  List<Widget> _buildActions() {
    return [
        SizedBox(
          width: 120,
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return MyColor.black;
              }),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('취소', style: MyTextStyle.white16w600),
          ),
        ),
        SizedBox(
          width: 120,
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return MyColor.black;
              }),
            ),
            onPressed: () {
              widget.onPressed();
            },
            child: const Text('요청하기', style: MyTextStyle.white16w600),
          ),
        ),
      ];
  }

}
