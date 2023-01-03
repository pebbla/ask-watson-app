import 'dart:math';

import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/presentation/search/search_view_model.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

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
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                _searchTextField(viewModel),
                _cafeList(viewModel.cafeList),
                Divider(thickness: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _searchTextField(viewModel) {
    return Container(
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
    return Container(
      padding: EdgeInsets.only(top: 24, bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("카페 검색결과 ${cafeList.length}",
                  style: MyTextStyle.black18w600),
              cafeList.length > 0 ? Text("더보기 >", style: MyTextStyle.grey14w500) : Container(),
            ],
          ),
          Padding(padding: EdgeInsets.all(4)),
          Divider(thickness: 1, color: MyColor.grey),


          // // 카페 리스트 보기
          ListView.builder(
            shrinkWrap: true,
            itemCount: min(3, cafeList.length),
            itemBuilder: (BuildContext context, index) {
            return _cafeitem(cafeList[index]);
          })
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
                  rating: double.parse((cafe.name ?? 0).toString()),
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
}
