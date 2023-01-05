import 'dart:math';

import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/category.dart';
import 'package:ask_watson_app/src/data/repository/cafe_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/category_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/cafe_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/theme_use_case.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;

import '../../domain/use_case/category_use_case.dart';

class MainViewModel extends ChangeNotifier {

  MainViewModel() {
    getCategoryList();
    getCafeList();
    getThemeList();
  }

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final CafeUseCase _cafeUseCase = CafeUseCase(CafeRepositoryImpl());
  final ThemeUseCase _themeUseCase = ThemeUseCase(ThemeRepositoryImpl());


  List<Category> _categoryList = [];
  List<Category> get categoryList => _categoryList;

  // cafe, theme provider에서 정보 받아오기
  List<Cafe> _cafeList = [];
  List<m.Theme> _themeList = [];

  List<Cafe> _twoRandomCafe = [];
  List<Cafe> get twoRandomCafe => _twoRandomCafe;

  List<m.Theme> _twoRandomTheme = [];
  List<m.Theme> get twoRandomTheme => _twoRandomTheme;


  /**
   * 카테고리 가져오기
   */
  void getCategoryList() async {
    var usecase = CategoryUseCase(CategoryRepositoryImpl());
    var response = await usecase.getCategoryList();
    _categoryList = response[ApiResponse.Data];
    notifyListeners();
  }


  /**
   * 카페정보 가져오기
   */
  void getCafeList() async {
    var response = await _cafeUseCase.getCafeList();
    _cafeList = response[ApiResponse.Data];
    if(_cafeList.isNotEmpty) {
      List<int> randomNum;
      randomNum = getRandomNum(_cafeList.length - 1);
      _twoRandomCafe = [_cafeList[randomNum[0]], _cafeList[randomNum[1]]];
    }
    notifyListeners();
  }


  /**
   * 테마정보 가져오기
   */
  void getThemeList() async {
    var response = await _themeUseCase.getThemeList();
    _themeList = response[ApiResponse.Data];
    if(_themeList.isNotEmpty) {
      List<int> randomNum;
      randomNum = getRandomNum(_themeList.length - 1);
      _twoRandomTheme = [_themeList[randomNum[0]], _themeList[randomNum[1]]];
    }
    notifyListeners();
  }


  /**
   * 난수 생성
   */
  List<int> getRandomNum(int max) {
    if(max == 0) {
      return [0, 0];
    }
    int num1 = Random().nextInt(max);
    int num2 = Random().nextInt(max);
    while(num1 == num2) {
      num2 = Random().nextInt(max);
    }
    return [num1, num2];
  }



}