import 'package:ask_watson_app/src/data/data_source/local_data_source/location_list.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/location.dart';
import 'package:ask_watson_app/src/data/repository/location_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/location_user_case.dart';
import 'package:flutter/material.dart';

class CafeViewModel extends ChangeNotifier {

  CafeViewModel() {
    getStates();
  }

  List<Cafe> _cafeList = [];
  List<Cafe> get cafeList => _cafeList;

  String _selectedState = '';
  String get selectedState => _selectedState;

  List<String> _stateList = [];
  List<String> get stateList => _stateList;

  List<Location> _cityList = [];
  List<Location> get cityList => _cityList;

  List<Location> _selectedLocationList = [];
  List<Location> get selectedLocationList => _selectedLocationList;

  String _curPage = "위치";
  String get curPage => _curPage;

  String _sortingCondition = "정렬";
  String get sortingCondition => _sortingCondition;


  set cafeList(List<Cafe> cafeList) {
    _cafeList = cafeList;
  }

  // 모달 조건 페이지 변경 감지
  void chageCurPage(String text) {
    _curPage = text;
    notifyListeners();
  }

  // 검색 조건 - 위치 : state 불러오기
  void getStates() {
    _stateList = location_list.map((location) => location.state).toSet().toList();
    notifyListeners();
  }
  // 검색 조건 - 위치 : state 변화에 따라 city 불러오기
  void getCities(String state) {
    _selectedState = state;
    _cityList = location_list
        .where((location) => location.state == state)
        .map((location) => location)
        .toList();
    notifyListeners();
  }
  // 검색 조건 - 위치 : 선택한 city list에 넣기
  void putCity(Location item) {
    _selectedLocationList.add(item);
    notifyListeners();
  }
  void removeCity(int index) {
    _selectedLocationList.remove(index);
    notifyListeners();
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