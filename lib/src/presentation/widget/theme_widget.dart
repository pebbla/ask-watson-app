import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;

// grid 버전
class ThemeGridWidget extends StatelessWidget {
  final m.Theme theme;

  const ThemeGridWidget({super.key, required this.theme});

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
                    onPressed: () {
                      // TODO : 하트 좋아요 넣기
                    },
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.black14w600,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Text('|'),
                    Padding(padding: EdgeInsets.all(2)),
                    Flexible(child: Text('${theme.category?.name ?? '공포'}'))
                  ],
                ),
                Padding(padding: EdgeInsets.all(2)),
                Text('${theme.cafe?.name ?? '포인트 나인 안양점'}',
                    style: MyTextStyle.black14w500),
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

// list 버전
class ThemeListWidget extends StatelessWidget {
  final m.Theme theme;

  const ThemeListWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: MyColor.lightlightGrey,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
          Padding(padding: EdgeInsets.all(4)),
          Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${theme.name ?? '학교 탈출'}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyle.black14w600,
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Text('|'),
                        Padding(padding: EdgeInsets.all(2)),
                        Text('${theme.category?.name ?? '공포'}')
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Text('${theme.cafe?.name ?? '포인트 나인 안양점'}',
                        style: MyTextStyle.black14w500),
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
                // TODO : null인 경우 처리
                Text('2022년 05월 01일에 탈출', style: MyTextStyle.grey14w500)
              ],
            ),
          )
        ],
      ),
    );
  }
}
