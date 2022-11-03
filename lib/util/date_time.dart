

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDateTime {

  
  // date picker
  static void showDatePicker({
    required BuildContext context,
    required Function onDateTimeChanged,
  }) {
    DateTime date = DateTime(2000, 1, 1);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: CupertinoDatePicker(
            dateOrder: DatePickerDateOrder.ymd,
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              onDateTimeChanged(newDate);
            },
          ),
        );
      },
    );
  }
}