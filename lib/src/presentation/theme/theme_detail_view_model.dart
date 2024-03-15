
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_response.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/model/review.dart';
import 'package:ask_watson_app/src/data/repository/check_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/heart_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/report_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/review_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/check_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/heart_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/report_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/review_use_case.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class ThemeDetailViewModel extends ChangeNotifier {

  ThemeDetailViewModel(this.theme, this._hearted, this._checked) {
    getReviewList();
  }

  final m.Theme theme;
  bool _hearted;
  bool get hearted => _hearted;
  bool _checked;
  bool get checked => _checked;

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  TextEditingController controller = TextEditingController();

  HeartUseCase _heartUseCase = HeartUseCase(HeartRepositoryImpl());
  CheckUseCase _checkUseCase = CheckUseCase(CheckRepositoryImpl());
  ReviewUseCase _reviewUseCase = ReviewUseCase(ReivewRepositoryImpl());
  ReportUseCase _reportUseCase = ReportUseCase(ReportRepositoryImpl());
  

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


  void getReviewList() async {
    Map<ApiResponse, dynamic> response = await _reviewUseCase.getReivewByThemeId(theme.id!);
    if(response[ApiResponse.Status] == ApiStatus.OK) {
      _reviews = response[ApiResponse.Data];
    }
    notifyListeners();
  }

    void createReport(BuildContext context, themeId) async {
    var response = await _reportUseCase.createReport(2, themeId, controller.text);
    if(response[ApiResponse.Status] == ApiStatus.OK || response[ApiResponse.Status] == ApiStatus.Created) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('접수 완료되었습니다. 빠른시일안에 수정하겠습니다.')));
    }
    Navigator.pop(context);
  }

}
