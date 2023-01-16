import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';


// 그리드 위젯
class CafeGridWidget extends StatelessWidget {

  final Cafe cafe;
  final Function? onTap;

  const CafeGridWidget({super.key, required this.cafe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 160,
              child: ClipRRect(
                child: Container(
                  width: double.maxFinite,
                  child: Image.network(cafe.imageUrl!, fit: BoxFit.cover),
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cafe.name!}',
                    style: MyTextStyle.black16w600,
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StarWidget(rating: double.parse(cafe.rating.toString())),
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


// list 위젯
class CafeListWidget extends StatelessWidget {

  final Cafe cafe;
  final Function? onTap;

  const CafeListWidget({super.key, required this.cafe, required this.onTap});

@override
Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 88,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: SizedBox(
              width: 72,
              height: 72,
              child: Image.network(cafe.imageUrl!, fit: BoxFit.cover),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${cafe.name}",
                  style: MyTextStyle.black16w500),
              const Padding(padding: EdgeInsets.all(1)),
              StarWidget(
                  rating: double.parse((cafe.rating ?? 0).toString()),
                  color: MyColor.black),
              const Padding(padding: EdgeInsets.all(2)),
              // TODO 현재 위치로부터 떨어져 있는 거리
              Row(
                children: [
                  Icon(Icons.pin_drop_outlined, size: 18),
                  Padding(padding: EdgeInsets.all(2)),
                  Text("거리 정보 없음", style: MyTextStyle.grey14w500)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}