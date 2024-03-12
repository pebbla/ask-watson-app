import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/repository/suggestion_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/suggeation_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/theme_use_case.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:flutter/material.dart';

class CafeDetailViewModel extends ChangeNotifier {
  final cafeId;

  TextEditingController controller = TextEditingController();
  SuggestionUseCase _useCase = SuggestionUseCase(SuggestionRepositoryImpl());

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

  void createSuggestion(BuildContext context) async {
    var response = await _useCase.createSuggestion(2, cafeId, controller.text);
    if(response[ApiResponse.Status] == ApiStatus.OK || response[ApiResponse.Status] == ApiStatus.Created) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('접수 완료되었습니다. 빠른시일안에 수정하겠습니다.')));
    }
    Navigator.pop(context);
  }


}