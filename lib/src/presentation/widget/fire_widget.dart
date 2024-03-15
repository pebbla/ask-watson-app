import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:flutter/material.dart';

enum FireStatus { empty, half, full }

class FireWidget extends StatelessWidget {
  final double rating;
  Color color;

  FireWidget({super.key, required this.rating, this.color = MyColor.red});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        fire(rating - 0),
        fire(rating - 1),
        fire(rating - 2),
        fire(rating - 3),
        fire(rating - 4),
      ],
    );
  }

  Widget fire(double scope) {
    FireStatus status;

    if (scope <= 0) {
      status = FireStatus.empty;
    } else if (scope < 1) {
      status = FireStatus.half;
    } else {
      status = FireStatus.full;
    }

    switch (status) {
      case FireStatus.empty:
        return Icon(Icons.local_fire_department_outlined, color: MyColor.grey, size: 16);
      case FireStatus.half:
        return Icon(Icons.local_fire_department_outlined, color: MyColor.red, size: 16);
      case FireStatus.full:
        return Icon(Icons.local_fire_department, color: MyColor.red, size: 16);
    }
  }
}
