import 'package:ask_watson_app/src/data/model/category.dart';
import 'package:ask_watson_app/src/data/repository/category_repository_impl.dart';
import 'package:ask_watson_app/util/enum/api_response.dart';
import 'package:flutter/material.dart';

import '../../domain/use_case/category_use_case.dart';

class MainViewModel extends ChangeNotifier {

  MainViewModel() {
    getCategoryList();
  }

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  List<Category> _categoryList = [];
  List<Category> get categoryList => _categoryList;

  void getCategoryList() async {
    var usecase = CategoryUseCase(CategoryRepositoryImpl());
    var response = await usecase.getCategoryList();
    _categoryList = response[ApiResponse.Data];
    notifyListeners();
  }

  void onChanged(){
    print(controller.text);
  }
}