import 'dart:math';

import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:ask_watson_app/src/presentation/search/search_view_model.dart';
import 'package:ask_watson_app/src/presentation/theme/theme_detail_screen.dart';
import 'package:ask_watson_app/src/presentation/widget/cafe_widget.dart';
import 'package:ask_watson_app/src/presentation/widget/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/app_bar.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: MyAppBar("", () => Navigator.pop(context)),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchTextField(viewModel),
                _cafeList(viewModel.cafeList),
                _themeList(viewModel.themeList),
                _noneWidget(viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextField(viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: 56,
      child: TextField(
        onChanged: (text) => viewModel.onChanged(text),
        controller: _controller,
        focusNode: _focusNode,
        cursorColor: MyColor.grey,
        decoration: InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              Icons.search,
              color: MyColor.grey,
            ),
            hintText: '검색어를 입력하세요',
            hintStyle: MyTextStyle.grey14w500,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: MyColor.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: MyColor.grey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: MyColor.grey))),
      ),
    );
  }

  // 카페 리스트
  Widget _cafeList(List<Cafe> cafeList) {
    return cafeList.length == 0
    ? Container()
    : Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 24, bottom: 8, left: 24, right: 24),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("카페 검색결과 ${cafeList.length}",
                      style: MyTextStyle.black18w600),
                  cafeList.length > 3
                      ? const Text("더보기 >", style: MyTextStyle.grey14w500)
                      : Container(),
                ],
              ),
              const Padding(padding: EdgeInsets.all(4)),
              const Divider(thickness: 1, color: MyColor.grey),

              // 카페 리스트 보기
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(3, cafeList.length),
                  itemBuilder: (_, index) => CafeListWidget(cafe: cafeList[index], onTap: null))
            ],
          ),
        ),
        const Divider(thickness: 12),
      ],
    );
  }

  // 테마 리스트
  Widget _themeList(List<m.Theme> themeList) {
    return themeList.length == 0
        ? Container()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("카페 검색결과 ${themeList.length}",
                        style: MyTextStyle.black18w600),
                    themeList.length > 3
                        ? const Text("더보기 >", style: MyTextStyle.grey14w500)
                        : Container(),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(4)),
                const Divider(thickness: 1, color: MyColor.grey),
                const Padding(padding: EdgeInsets.all(2)),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, index) => ThemeGridWidget(
                      theme: themeList[index],
                      onHeartTap: null,
                      onThemeTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => ThemeDetailScreen(theme: themeList[index])
                          ),
                        );
                      }),
                  itemCount: min(4, themeList.length),
                )
              ],
            ),
          );
  }

  // 검색 결과 없을 때
  Widget _noneWidget(viewModel) {
    return viewModel.cafeList.length == 0 && viewModel.themeList.length == 0
        ? Container(
          padding: const EdgeInsets.all(24),
            child: const Text("! 검색 결과가 없습니다.", style: MyTextStyle.grey14w500),
          )
        : Container();
  }
}
