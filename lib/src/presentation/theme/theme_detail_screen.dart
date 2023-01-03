import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/data_source/remote_data_source/enum/api_status.dart';
import 'package:ask_watson_app/src/data/model/check.dart';
import 'package:ask_watson_app/src/data/model/heart.dart';
import 'package:ask_watson_app/src/data/model/review.dart';
import 'package:ask_watson_app/src/data/repository/heart_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/check_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/heart_use_case.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;

import '../../data/data_source/remote_data_source/enum/api_response.dart';
import '../../data/repository/check_repository_impl.dart';

class ThemeDetailScreen extends StatefulWidget {
  final m.Theme theme;

  ThemeDetailScreen({super.key, required this.theme});

  @override
  State<ThemeDetailScreen> createState() => _ThemeDetailScreenState();
}

class _ThemeDetailScreenState extends State<ThemeDetailScreen> {

  Review review = Review(createdAt: "12.05", rating: 3, content: "안녕하세요 리뷰입니다. 리뷰리뷰!! ㅁㄴ어린멍링너리ㅏㅇ너리ㅏㅓㅇ니라ㅓㄴ이ㅏ럼ㅇ나ㅣ러ㅣㄴ아러ㅣㅁ나ㅓ링나ㅓ리ㅏㅇㄴ머리ㅏㅇㄴ머리;ㅏㅁ넝리;ㅏ넝ㄹ;ㅣㅏㅓㄴㅇ리;ㅏㅓㅁㄴ이;라ㅓㅇㄴ미;ㅏ러ㅣ;ㅇㄴ마ㅓ리;ㄴ아머링ㄴ마ㅓ리ㅏㅓㅇㄹ니ㅏ;ㅓ미나렁님;ㅏ러ㅣ;ㄴ마ㅓㅇ리;ㅇ나ㅓㅁ");
  Heart? heart;
  Check? check;
  bool _themeCheck = false;
  bool _themeHeart = false;
  HeartUseCase _heartUseCase = HeartUseCase(HeartRepositoryImpl());
  CheckUseCase _checkUseCase = CheckUseCase(CheckRepositoryImpl());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _themeImage(),
              _themeDetail(),
              _reviewList(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _themeImage() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 1.2,
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Image.network(
                        widget.theme.imageUrl ?? "",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async {
                          Map<ApiResponse, dynamic> response;

                          // TODO : 1 -> useid 로 변경
                          if(_themeHeart == false) {
                            response = await _heartUseCase.createHeart(1, widget.theme.id);
                            heart = response[ApiResponse.Data];
                          } else {
                            response = await _heartUseCase.deleteHeart(heart?.id ?? 0);
                          }

                          if (response[ApiResponse.Status] == ApiStatus.Success) {
                            setState(() {
                              _themeHeart = !_themeHeart;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          child: _themeHeart
                              ? const Icon(Icons.favorite, color: MyColor.red, size: 30)
                              : const Icon(Icons.favorite_border_outlined, color: MyColor.red, size: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // theme 상세 설명
  Widget _themeDetail() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // 테마 설명
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text('${widget.theme.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.black18w600),
                  ),
                  _checkBtn(),
                ],
              ),
              Row(
                children: [
                  Text("${widget.theme.cafe?.name}",
                      style: MyTextStyle.black14w500),
                  const Padding(padding: EdgeInsets.all(1)),
                  Text(" | ${widget.theme.category?.name}",
                      style: MyTextStyle.grey14w500),
                ],
              ),
              Row(
                children: [
                  StarWidget(
                      rating: double.parse(
                          (widget.theme.rating ?? 0.0).toString())),
                  const Padding(padding: EdgeInsets.all(2)),
                  Text("${widget.theme.rating ?? 0.0}", style: MyTextStyle.grey14w500),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Icon(Icons.heart_broken, color: MyColor.red, size: 20),
                  const Padding(padding: EdgeInsets.all(2)),
                  Text("${widget.theme.heartCount ?? 0.0}", style: MyTextStyle.grey14w500),
                ],
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(8)),
        const Divider(thickness: 1, color: MyColor.grey),
        const Padding(padding: EdgeInsets.all(12)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.maxFinite,
          child: Text("${widget.theme.explanation}"),
        ),
        const Padding(padding: EdgeInsets.all(12)),
        const Divider(thickness: 1, color: MyColor.grey),
      ],
    );
  }


  // 리뷰 리스트
  Widget _reviewList() {
    List<Review> reviews = [review, review, review];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("리뷰수 ${reviews.length}", style: MyTextStyle.black18w600),
              const Text("더보기 >", style: MyTextStyle.grey14w500),
            ],
          ),
          const Padding(padding: EdgeInsets.all(6)),
          _writeReviewBtn(),
          const Padding(padding: EdgeInsets.all(6)),
          ListView.separated(
              padding:const EdgeInsets.all(0),
              shrinkWrap: true,
              itemBuilder: (context, index) => _reviewItem(review),
              separatorBuilder: (_, __) => const Divider(thickness: 1),
              itemCount: reviews.length)
        ],
      ),
    );
  }

  // 리뷰 아이템
  Widget _reviewItem(Review review) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("${review.usedHintNum ?? "익명"}", style: MyTextStyle.black16w600),
              const Icon(
                Icons.warning,
                color: MyColor.red,
                size: 18,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(2)),
          Row(
            children: [
              StarWidget(
                  rating: double.parse((widget.theme.rating ?? 0.0).toString()),
                  color: MyColor.black),
              const Padding(padding: EdgeInsets.all(2)),
              Text("${review.createdAt}"),
            ],
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Text(
            "${review.content}",
            maxLines: 3,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
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
          borderRadius: const BorderRadius.all(Radius.circular(12))),
        child:
            const Center(child: Text("리뷰 작성하기", style: MyTextStyle.grey16w500)),
      ),
    );
  }

  // 탈출 완료 버튼
  Widget _checkBtn() {
    return GestureDetector(
      onTap: () async {

        Map<ApiResponse, dynamic> response;

        if(_themeCheck == false) {
          response = await _checkUseCase.createCheck(1, widget.theme.id ?? 0);
          check = response[ApiResponse.Data];
        } else {
          response = await _checkUseCase.deleteCheck(check?.id ?? 0);
        }

        if(response[ApiResponse.Status] == ApiStatus.Success) {
          setState(() {
            _themeCheck = !_themeCheck;
          });
        } else if(response[ApiResponse.Status] == ApiStatus.MethodNotAllowed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response[ApiResponse.StatusMessage] ?? "다시 시도해주세요")));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: _themeCheck ? MyColor.green : MyColor.white,
            border: Border.all(width: 1, color: MyColor.green),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text("탈출 완료",
            style:
                TextStyle(color: _themeCheck ? MyColor.white : MyColor.green)),
      ),
    );
  }
}
