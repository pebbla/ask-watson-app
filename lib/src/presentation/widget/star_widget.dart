import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:flutter/material.dart';

enum StarStatus { empty, half, full }

class StarWidget extends StatelessWidget {
  final double rating;

  const StarWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          star(rating - 0),
          star(rating - 1),
          star(rating - 2),
          star(rating - 3),
          star(rating - 4),
        ],
      ),
    );
  }

  Widget star(double scope) {
    StarStatus status;

    if (scope <= 0) {
      status = StarStatus.empty;
    } else if (scope < 1) {
      status = StarStatus.half;
    } else {
      status = StarStatus.full;
    }

    switch (status) {
      case StarStatus.empty:
        return const Icon(Icons.star_border_outlined,
            color: MyColor.yellow, size: 16);
      case StarStatus.half:
        return const Icon(Icons.star_half, color: MyColor.yellow, size: 16);
      case StarStatus.full:
        return const Icon(Icons.star, color: MyColor.yellow, size: 16);
    }
  }
}
