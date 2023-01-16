
import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget MyAppBar(String title, VoidCallback? onTap) {

  return AppBar(
    backgroundColor: MyColor.white,
    elevation: 0,
    toolbarHeight: 70,
    centerTitle: true,
    title: Text(
      title,
      style: MyTextStyle.black16w500,
      textAlign: TextAlign.center,
    ),
    leading: onTap == null 
    ? Container()
    : GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: const Icon(Icons.arrow_back_ios_new, color: MyColor.grey)
      ),
    ),

  );
}