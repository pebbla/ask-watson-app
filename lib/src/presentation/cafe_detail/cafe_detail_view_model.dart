import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/theme_use_case.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:flutter/material.dart';

class CafeDetailViewModel extends ChangeNotifier {
  final cafeId;

  List<m.Theme> _themeList = [];
  List<m.Theme> get themeList => _themeList;

  CafeDetailViewModel(this.cafeId) {
    getThemeList();
  }

  void getThemeList() async {
    var response = await ThemeUseCase(ThemeRepositoryImpl()).getThemeListByCafeId(cafeId);
    _themeList = response[ApiResponse.Data];
    notifyListeners();

  }


}