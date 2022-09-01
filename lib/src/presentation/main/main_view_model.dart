import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void onChanged(){
    print(controller.text);
  }
}