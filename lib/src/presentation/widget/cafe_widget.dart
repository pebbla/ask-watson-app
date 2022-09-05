import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';

class CafeWidget extends StatelessWidget {

  final Cafe cafe;

  const CafeWidget({super.key, required this.cafe});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 160,
              //TODO : 사진 넣기
              child: Container(
                decoration: BoxDecoration(
                    color: MyColor.lightlightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cafe.name ?? '키이스케이프 강남점'}',
                    style: MyTextStyle.black16w600,
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StarWidget(rating: cafe.rating ?? 4.0),
                      Padding(padding: EdgeInsets.all(2)),
                      Text('${cafe.rating ?? 0.0}',
                          style: MyTextStyle.grey14w500)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}