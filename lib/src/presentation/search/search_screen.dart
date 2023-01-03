import 'dart:math';

import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:ask_watson_app/src/presentation/search/search_view_model.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final viewModelWatch = context.watch<SearchViewModel>();
    final viewModel = context.read<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.white,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchTextField(viewModelWatch),
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
                      ? Text("더보기 >", style: MyTextStyle.grey14w500)
                      : Container(),
                ],
              ),
              Padding(padding: EdgeInsets.all(4)),
              Divider(thickness: 1, color: MyColor.grey),

              // 카페 리스트 보기
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(3, cafeList.length),
                  itemBuilder: (_, index) => _cafeitem(cafeList[index]))
            ],
          ),
        ),
        Divider(thickness: 12),
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
                  itemBuilder: (_, index) => _themeItem(themeList[index]),
                  itemCount: min(4, themeList.length),
                )
              ],
            ),
          );
  }

  // 테마 아이템
  Widget _themeItem(m.Theme theme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO : 여기다가 사진을 넣습니다.
          Container(
            color: Colors.blueAccent,
            width: 160,
            height: 160,
          ),
          const Padding(padding: EdgeInsets.all(2)),
          Text("${theme.name}", style: MyTextStyle.black16w500),
          const Padding(padding: EdgeInsets.all(1)),
          Text("${theme.cafe?.name}"),
          StarWidget(rating: double.parse((theme.rating ?? 0).toString()))
        ],
      ),
    );
  }

  // 카페 아이템
  Widget _cafeitem(Cafe cafe) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 88,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            // TODO 여기에 사진 넣기
            child: Container(),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${cafe.name ?? '포인트나인 강남점'}",
                  style: MyTextStyle.black16w500),
              Padding(padding: EdgeInsets.all(1)),
              StarWidget(
                  rating: double.parse((cafe.rating ?? 0).toString()),
                  color: MyColor.black),
              Padding(padding: EdgeInsets.all(2)),
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
  Widget _noneWidget(viewModel) {
    return viewModel.cafeList.length == 0 && viewModel.themeList.length == 0
        ? Container(
          padding: EdgeInsets.all(24),
            child: Text("! 검색 결과가 없습니다.", style: MyTextStyle.grey14w500),
          )
        : Container();
  }
}
