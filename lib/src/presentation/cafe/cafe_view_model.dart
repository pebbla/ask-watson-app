import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:flutter/material.dart';

class CafeViewModel extends ChangeNotifier {

  List<Cafe> _cafeList = [];
  List<Cafe> get cafeList => _cafeList;

  set cafeList(List<Cafe> cafeList) {
    _cafeList = cafeList;
  }

  

}