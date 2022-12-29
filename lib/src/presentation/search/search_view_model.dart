import 'package:ask_watson_app/src/data/repository/cafe_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/cafe_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/theme_use_case.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {

  CafeUseCase _cafeUseCase = CafeUseCase(CafeRepositoryImpl());
  ThemeUseCase _themeUseCase = ThemeUseCase(ThemeRepositoryImpl());

  void onChanged(String text){
    print("on Changed 함수가 불렸습니다.");
    // TODO : debounce 적용
    _cafeUseCase.getCafeListBySearch(text);
    _themeUseCase.getThemeListBySearch(text);

  }
  
}