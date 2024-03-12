
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/repository/check_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/heart_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/check_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/heart_use_case.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class ThemeDetailViewModel extends ChangeNotifier {

  final m.Theme theme;
  bool _hearted;
  bool get hearted => _hearted;
  bool _checked;
  bool get checked => _checked;


  HeartUseCase _heartUseCase = HeartUseCase(HeartRepositoryImpl());
  CheckUseCase _checkUseCase = CheckUseCase(CheckRepositoryImpl());
  ThemeDetailViewModel(this.theme, this._hearted, this._checked);


  void onHeartTap() async {
    HapticFeedback.lightImpact();

     Map<ApiResponse, dynamic> response;
    if(_hearted == false) {
      response = await _heartUseCase.createHeart(2, theme.id);
    } else {
      // TODO: heart id 를 몰라서 삭제가 불가능. 이거 수정이 필요할 듯.
      response = await _heartUseCase.deleteHeart(0);
    }
    
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      _hearted = !_hearted;
    }
    notifyListeners();
  }


  void onCheckTap() async {
    HapticFeedback.lightImpact();

     Map<ApiResponse, dynamic> response;
    if(_checked == false) {
      response = await _checkUseCase.createCheck(2, theme.id);
    } else {
      // TODO: check id 를 몰라서 삭제가 불가능. 이거 수정이 필요할 듯.
      response = await _checkUseCase.deleteCheck(0);
    }
    
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      _checked = !_checked;
    }
    notifyListeners();
  }

}
