import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:flutter/material.dart';

class ModifyDialogWidget extends StatefulWidget {
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
      content: Column(
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
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
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
              //TODO : suggestion api 연결
            },
            child: const Text('요청하기', style: MyTextStyle.white16w600),
          ),
        ),
      ],
    );
  }
}
