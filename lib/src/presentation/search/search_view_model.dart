import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:ask_watson_app/src/data/repository/cafe_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/cafe_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/theme_use_case.dart';
import 'package:ask_watson_app/util/debouncer.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {

  final CafeUseCase _cafeUseCase = CafeUseCase(CafeRepositoryImpl());
  final ThemeUseCase _themeUseCase = ThemeUseCase(ThemeRepositoryImpl());

  List<Cafe> _cafeList = [];
  List<Cafe> get cafeList => _cafeList;

  List<m.Theme> _themeList = [];
  List<m.Theme> get themeList => _themeList;

  final _debouncer = Debouncer(milliseconds: 500);

  void onChanged(String text) {
    _debouncer.run(() async {
      print("on Changed 함수가 불렸습니다.");
      Map<ApiResponse, dynamic> responseCafe = await _cafeUseCase.getCafeListBySearch(text);
      if(responseCafe[ApiResponse.Status] == ApiStatus.Success){
        _cafeList = responseCafe[ApiResponse.Data];
      }

      Map<ApiResponse, dynamic> responseTheme = await _themeUseCase.getThemeListBySearch(text);
        if(responseTheme[ApiResponse.Status] == ApiStatus.Success){
        _themeList = responseTheme[ApiResponse.Data];
      }
      notifyListeners();
    });
  }
}