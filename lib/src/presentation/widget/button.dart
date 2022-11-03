import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:flutter/material.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  double? height;
  int intervalMs = 1000;
  int lastTimeClicked = 0;

  ButtonPrimaryWidget({
    required this.text,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height ?? 52,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24))),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.black),
        onPressed: (){
          final now = DateTime.now().millisecondsSinceEpoch;
          if (now - lastTimeClicked < intervalMs) {
            return;
          }
          lastTimeClicked = now;
          onPressed();
        },
        child: Text(
          '${text}',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}


class ButtonDisabledWidget extends StatelessWidget {
  final String text;
  double? height;
  int intervalMs = 1000;
  int lastTimeClicked = 0;

  ButtonDisabledWidget({
    required this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height ?? 52,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24))),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.grey),
        onPressed: (){},
        child: Text(
          '${text}',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}


class ButtonWhiteWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  double? height;
  int intervalMs = 1000;
  int lastTimeClicked = 0;

  ButtonWhiteWidget({
    required this.text,
    this.height, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.maxFinite,
        height: height ?? 52,
        decoration: BoxDecoration(
          border: Border.all(color: MyColor.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: TextButton(
          onPressed: () {
            final now = DateTime.now().millisecondsSinceEpoch;
            if (now - lastTimeClicked < intervalMs) {
              return;
            }
            lastTimeClicked = now;
            onPressed();
          },
          child: Text(
            '${text}',
            style: MyTextStyle.black16w500,
          ),
        ),
      ),
    );
  }
}