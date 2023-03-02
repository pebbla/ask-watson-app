import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/location.dart';
import 'package:ask_watson_app/src/data/repository/location_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/location_user_case.dart';
import 'package:flutter/material.dart';

class CafeViewModel extends ChangeNotifier {

  CafeViewModel() {
    getLocationList();
  }

  List<Cafe> _cafeList = [];
  List<Cafe> get cafeList => _cafeList;

  List<Location> _totalLocationList = [];

  String _selectedState = '';
  String get selectedState => _selectedState;

  List<String> _stateList = [];
  List<String> get stateList => _stateList;

  List<Location> _cityList = [];
  List<Location> get cityList => _cityList;

  final LocationUseCase _locationUseCase = LocationUseCase(LocationRepositoryImpl());

  String _sortingCondition = "정렬";
  String get sortingCondition => _sortingCondition;

  set cafeList(List<Cafe> cafeList) {
    _cafeList = cafeList;
  }


  // location 데이터 불러오기 state 데이터 정렬
  void getLocationList() async {
    var response = await _locationUseCase.getLocationList();
    _totalLocationList = response[ApiResponse.Data];
    String temp = '';
    for(int i = 0; i < _totalLocationList.length; i++) {
      if(temp == _totalLocationList[i].state) {
        continue;
      } else {
        temp = _totalLocationList[i].state;
      }
      stateList.add(temp);
    }
    notifyListeners();
  }


  // location.city 데이터 불러오기
  void changeCityListByState(String state) {
    print('city 가 바뀌었습니다.  ${state}');
    _cityList = [];
    _selectedState = state;
    for(int i = 0; i < _totalLocationList.length; i++) {
      print('state: ${state}, ${_totalLocationList[i].state}');
      if(_totalLocationList[i].state == state) {
        _cityList.add(_totalLocationList[i]);
      }
    }
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