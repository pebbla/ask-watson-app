import 'package:ask_watson_app/src/data/repository/cafe_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/cafe_use_case.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:flutter/material.dart';

import '../../data/model/cafe.dart';

class CafeProvider extends ChangeNotifier {

  final CafeUseCase _cafeUseCase = CafeUseCase(CafeRepositoryImpl());

  Cafe? _cafe;
  List<Cafe>? _cafeList;
  Cafe? get cafe => _cafe;
  List<Cafe>? get cafeList => _cafeList;

  void getCafeList() async {
    var response = await _cafeUseCase.getCafeList();
    _cafeList = response[ApiResponse.Data];
    notifyListeners(); 
  }


}