import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateTime {

  // date picker
  static void showDatePicker({
    required BuildContext context,
    required Function onDateTimeChanged,
  }) {
    DateTime date = DateTime(2000, 1, 1);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    
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
              String date = formatter.format(newDate);
              onDateTimeChanged(date);
            },
          ),
        );
      },
    );
  }
}