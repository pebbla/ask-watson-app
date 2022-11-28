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

  List<Cafe> _cafeList = [];
  List<Cafe> get cafeList => _cafeList;

  List<m.Theme> _themeList = [];
  List<m.Theme> get themeList => _themeList;


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
    notifyListeners();
  }


  /**
   * 테마정보 가져오기
   */
  void getThemeList() async {
    var response = await _themeUseCase.getThemeList();
    _themeList = response[ApiResponse.Data];
    print('view model type : ${_themeList[0].runtimeType.toString()}');
    notifyListeners();
  }


  void onChanged(){
    // TODO : debounce 적용
    _cafeUseCase.getCafeListBySearch(controller.text);
    _themeUseCase.getThemeListBySearch(controller.text);

    //TODO : 데이터 전달받아서 검색 결과 페이지에 넘기기
    print(controller.text);
  }
}