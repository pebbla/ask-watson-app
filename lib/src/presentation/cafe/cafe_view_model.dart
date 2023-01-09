import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:flutter/material.dart';

class CafeViewModel extends ChangeNotifier {

  List<Cafe> _cafeList = [];
  List<Cafe> get cafeList => _cafeList;

  String _sortingCondition = "정렬";
  String get sortingCondition => _sortingCondition;

  set cafeList(List<Cafe> cafeList) {
    _cafeList = cafeList;
  }

  // 정렬 조건 변경 시
  void onChanged (String value) {
    _sortingCondition = value;
    notifyListeners();
  }
  
}