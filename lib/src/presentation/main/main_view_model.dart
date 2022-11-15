import 'package:ask_watson_app/src/data/model/category.dart';
import 'package:ask_watson_app/src/data/repository/cafe_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/category_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/cafe_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/theme_use_case.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:flutter/material.dart';

import '../../domain/use_case/category_use_case.dart';

class MainViewModel extends ChangeNotifier {

  MainViewModel() {
    getCategoryList();
  }

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final CafeUseCase _cafeUseCase = CafeUseCase(CafeRepositoryImpl());
  final ThemeUseCase _themeUseCase = ThemeUseCase(ThemeRepositoryImpl());

  List<Category> _categoryList = [];
  List<Category> get categoryList => _categoryList;


  /**
   * 카테고리 가져오기
   * TODO : 카테고리를 가져오는 것은 다른 곳에서 하는게 더 좋을 것 같다.
   */
  void getCategoryList() async {
    var usecase = CategoryUseCase(CategoryRepositoryImpl());
    var response = await usecase.getCategoryList();
    _categoryList = response[ApiResponse.Data];
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