import 'package:flutter/material.dart';

class AcceptTermViewModel with ChangeNotifier { 

  List<bool> _agreementList = [false, false, false, false];
  List<bool> get agreementList => _agreementList;

  // 전체 동의 버튼을 누르는 경우
  // 전체 동의 버튼을 끄는 경우
  // 밑에 네개를 체크하는 경우
  // 밑에 네개를 체크한 상태에서 하나의 체크를 빼는 경우


  bool isAgreementAll() {
    for (int i = 0; i < 4; i++) {
      if (_agreementList[i] == false) {
        return false;
      }
    }
    return true;
  } 

  void setAgreement(int index){
    _agreementList[index] = !_agreementList[index];
    notifyListeners();
  }

  void setAgreementAll() {
    if(isAgreementAll()) {
      _agreementList = [false, false, false, false];
    } else {
      _agreementList = [true, true, true, true];
    }
    notifyListeners();
  }


  bool checkEnableBtn() {
    for (int i = 0; i < 3; i++) {
      if (_agreementList[i] == false) {
        return false;
      }
    }
    return true;
  }
}