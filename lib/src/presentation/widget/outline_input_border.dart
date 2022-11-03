import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:flutter/material.dart';




OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: MyColor.black));
}

OutlineInputBorder enabledBorder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide( color :MyColor.grey));
}