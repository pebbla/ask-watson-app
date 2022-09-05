import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;

class ThemeWidget extends StatelessWidget {

  final m.Theme theme;

  const ThemeWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: MyColor.lightlightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.heart_broken, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${theme.name ?? '학교 탈출'}',
                        maxLines:1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.black14w600,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Text('|'),
                    Padding(padding: EdgeInsets.all(2)),
                    Flexible(
                      child: Text('${theme.category?.name ?? '공포'}'))
                  ],
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text('${theme.cafe?.name ?? '포인트 나인 안양점'}', style: MyTextStyle.black14w500),
                Padding(padding: EdgeInsets.all(2)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StarWidget(rating: theme.rating ?? 0.0),
                    Padding(padding: EdgeInsets.all(2)),
                    Text('${theme.rating ?? 0.0}',
                        style: MyTextStyle.grey14w500)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}