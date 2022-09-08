import 'package:flutter/material.dart';

class SetUp extends ChangeNotifier {

  bool _isGridView = true;
  bool get isGridView => _isGridView;

  void changeViewStyle(bool isGridView) {
    _isGridView = isGridView;
    notifyListeners();
  }
}