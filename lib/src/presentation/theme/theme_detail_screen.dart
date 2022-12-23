import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/review.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;

class ThemeDetailScreen extends StatefulWidget {
  final m.Theme theme;

  ThemeDetailScreen({super.key, required this.theme});

  @override
  State<ThemeDetailScreen> createState() => _ThemeDetailScreenState();
}

class _ThemeDetailScreenState extends State<ThemeDetailScreen> {
  bool _themeCheck = false;

  bool _themeHeart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _themeDetailTop(),
                _reviewList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _themeDetailTop() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 1.2,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _themeHeart = !_themeHeart;
                          });
                        },
                        child: _themeHeart 
                        ? Icon(Icons.heat_pump_rounded, color: MyColor.red)
                        : Icon(Icons.monitor_heart_outlined, color: MyColor.red),
                      )
                    ),
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      color: MyColor.red,
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(12)),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${widget.theme.name}', maxLines: 1, overflow: TextOverflow.ellipsis,),
                  _checkBtn(),
                ],
              ),
              Row(
                children: [
                  Text("${widget.theme.cafe?.name}", style: MyTextStyle.black14w500),
                  Padding(padding: EdgeInsets.all(1)),
                  Text("${widget.theme.category?.name}", style: MyTextStyle.grey14w500),
                ],
              ),
              Padding(padding: EdgeInsets.all(4)),
              Row(
                children: [
                  StarWidget(rating: 4.5),
                  Padding(padding: EdgeInsets.all(6)),
                  Icon(
                    Icons.heat_pump_sharp,
                    color: MyColor.yellow,
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(8)),

              // 테마 설명
              Divider(thickness: 1, color: MyColor.grey),
              Padding(padding: EdgeInsets.all(12)),
              Text("${widget.theme.explanation}"),
              Padding(padding: EdgeInsets.all(12)),
              Divider(thickness: 1, color: MyColor.grey),
            ],
          ),
        )
      ],
    );
  }

  // 리뷰 리스트
  Widget _reviewList() {
    List<Review> reviews = [];
    Review review = Review();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("리뷰수 ${reviews.length}", style: MyTextStyle.black18w600),
              Text("더보기 >", style: MyTextStyle.grey14w500)
            ],
          ),
          Padding(padding: EdgeInsets.all(12)),
          _writeReviewBtn(),
          _reviewItem(review),
          Divider(thickness: 1),
          _reviewItem(review),
          Divider(thickness: 1),
          _reviewItem(review),
          Divider(thickness: 1),
        ],
      ),
    );
  }

  // 리뷰 아이템
  Widget _reviewItem(Review review) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("칸쵸"),
              Icon(Icons.warning, color: MyColor.red),
            ],
          ),
          Row(
            children: [
              StarWidget(
                  rating: 4.5,
                  color: MyColor.black),
              Text("${review.createdAt}"),
            ],
          ),
          Text(
            "${review.content}",
            maxLines: 3,
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  //리뷰 작성하기 버튼
  Widget _writeReviewBtn() {
    return GestureDetector(
      onTap: () {
        // TODO : 리뷰 작성하기 화면으로 이동
      },
      child: Container(
        width: double.maxFinite,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: MyColor.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(child: Text("리뷰 작성하기", style: MyTextStyle.grey16w500)),
      ),
    );
  }


  // 탈출 완료 버튼
  Widget _checkBtn() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _themeCheck = !_themeCheck;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _themeCheck ? MyColor.green : MyColor.white,
            border: Border.all(width: 1, color: MyColor.green),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: Text("탈출 완료",
            style:
                TextStyle(color: _themeCheck ? MyColor.white : MyColor.green)),
      ),
    );
  }
}
