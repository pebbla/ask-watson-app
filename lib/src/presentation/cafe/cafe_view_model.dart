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

    switch (value) {
      case "평점":
        _cafeList.sort((a, b) => (a.rating ?? 0.0).compareTo(b.rating ?? 0.0));
        break;
      case "거리":
        break;
      case "리뷰":
        _cafeList.sort((a, b) => (a.reviewCount ?? 0.0).compareTo(b.reviewCount ?? 0.0));
        break;
      default:
    }
    
    notifyListeners();
  }
  
}