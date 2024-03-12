import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/review.dart';
import 'package:ask_watson_app/src/presentation/theme/theme_detail_view_model.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:provider/provider.dart';



class ThemeDetailScreen extends StatelessWidget {
  final m.Theme theme;
  const ThemeDetailScreen({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeDetailViewModel>(
      create: (context) => ThemeDetailViewModel(theme, theme.hearted!, theme.checked!),
      child: ThemeDetailView(theme: theme),
    );
  }
}

class ThemeDetailView extends StatelessWidget {
  final m.Theme theme;

  const ThemeDetailView({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _themeImage(context),
              _themeDetail(context),
              // _reviewList(),
            ],
          ),
        ),
      ),
    );
  }

  /**
   * 테마 이미지 & 좋아요 버튼
   */
  Widget _themeImage(BuildContext context) {
    final viewModel = context.watch<ThemeDetailViewModel>();
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.2,
      child: Stack(
        children: [
          // theme 이미지
          Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Image.network(viewModel.theme.imageUrl ?? "",
                  fit: BoxFit.fitWidth)),
          // 좋아요 버튼
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () async => viewModel.onHeartTap(),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: viewModel.hearted
                      ? const Icon(Icons.favorite, color: MyColor.red, size: 30)
                      : const Icon(Icons.favorite_border_outlined, color: MyColor.red, size: 30)),
            ),
          ),
        ],
      ),
    );
  }

  /**
   * 테마 상세 설명
   */
  Widget _themeDetail(BuildContext context) {
    final viewModel = context.read<ThemeDetailViewModel>();
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
                    child: Text('${viewModel.theme.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.black18w600),
                  ),
                  _checkBtn(viewModel.checked, ()=>viewModel.onCheckTap()),
                ],
              ),
              Row(
                children: [
                  Text("${viewModel.theme.cafe?.name}", style: MyTextStyle.black14w500),
                  const Padding(padding: EdgeInsets.all(1)),
                  Text(" | ${viewModel.theme.category?.name}", style: MyTextStyle.grey14w500),
                ],
              ),
              Row(
                children: [
                  StarWidget(rating: double.parse((viewModel.theme.rating ?? 0.0).toString())),
                  const Padding(padding: EdgeInsets.all(2)),
                  Text("${viewModel.theme.rating ?? 0.0}", style: MyTextStyle.grey14w500),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Icon(Icons.favorite, color: MyColor.red, size: 20),
                  const Padding(padding: EdgeInsets.all(2)),
                  Text("${viewModel.theme.heartCount ?? 0.0}", style: MyTextStyle.grey14w500),
                ],
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(8)),
        const Divider(thickness: 1, color: MyColor.grey),
        const Padding(padding: EdgeInsets.all(12)),
        // 테마 설명
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.maxFinite,
          child: Text("${viewModel.theme.explanation}"),
        ),
        const Padding(padding: EdgeInsets.all(12)),
        const Divider(thickness: 1, color: MyColor.grey),
      ],
    );
  }


  // 리뷰 리스트
  Widget _reviewList() {
    List<Review> reviews = [];

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
              itemBuilder: (context, index) => _reviewItem(context, reviews[index]),
              separatorBuilder: (_, __) => const Divider(thickness: 1),
              itemCount: reviews.length)
        ],
      ),
    );
  }

  // 리뷰 아이템
  Widget _reviewItem(context, Review review) {
    final viewModel = context.read<ThemeDetailViewModel>();
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
                  rating: double.parse((viewModel.theme.rating ?? 0.0).toString()),
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
  Widget _checkBtn(bool checked, Function onCheckTap) {
    return GestureDetector(
      onTap: () async => onCheckTap(),
      child: Container(
        decoration: BoxDecoration(
            color: checked ? MyColor.green : MyColor.white,
            border: Border.all(width: 1, color: MyColor.green),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text("탈출 완료",
            style: TextStyle(color: checked ? MyColor.white : MyColor.green)),
      ),
    );
  }
}
