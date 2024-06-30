import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/presentation/cafe/cafe_condition_widget.dart';
import 'package:ask_watson_app/src/presentation/cafe/cafe_view_model.dart';
import 'package:ask_watson_app/src/presentation/search/search_screen.dart';
import 'package:ask_watson_app/src/presentation/widget/app_bar.dart';
import 'package:ask_watson_app/src/presentation/widget/cafe_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeScreen extends StatelessWidget {
  
  List<Cafe> searchCafeList;
  CafeScreen({Key? key, required this.searchCafeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CafeViewModel>();
    viewModel.cafeList = searchCafeList;
    
    // TODO : context watch cafe list 전달하기
    return Scaffold(
      appBar: MyAppBar("카페", null),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              _searchBar(context),
              _condition(context),
              const Divider(color: MyColor.lightGrey, thickness: 1),
              _sortingConditionBtn(context),
              _cafeListWidget(viewModel.cafeList),
            ],
          ),
        ),
      ),
    );
  }


  // 검색창
  Widget _searchBar(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchScreen()))),
      child: Container(
        decoration: const BoxDecoration(
          color: MyColor.lightlightGrey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: const [
            Icon(Icons.search),
            Padding(padding: EdgeInsets.all(2)),
            Text("검색어를 입력하세요"),
          ],
        ),
      ),
    );
  }

  // 조건 위젯
  Widget _condition(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return CafeConditionModalWidget();
            });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: MyColor.white,
          border: Border.all(color: MyColor.lightlightGrey),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Text("조건 설정", style: MyTextStyle.black14w500),
      ),
    );
  }

  // 정렬 조건 선택 위젯
  Widget _sortingConditionBtn(BuildContext context) {
    final viewModel = context.watch<CafeViewModel>();

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: DropdownButton(
          value: viewModel.sortingCondition,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onChanged: (String? value) {
            viewModel.onChanged(value!);
          },
            items: const [
              DropdownMenuItem(child: Text("정렬"), value: "정렬", enabled: false),
              DropdownMenuItem(child: Text("평점순"), value: "평점"),
              DropdownMenuItem(child: Text("거리순"), value: "거리"),
              DropdownMenuItem(child: Text("리뷰순"), value: "리뷰"),
            ],
          selectedItemBuilder: (context) {
            return [
              DropdownMenuItem(
                  child: Row(children: [Icon(Icons.list), Padding(padding: EdgeInsets.all(4)), Text("정렬")]),
                  value: "정렬"),
              DropdownMenuItem(
                  child: Row(children: [Icon(Icons.check), Padding(padding: EdgeInsets.all(4)), Text("평점순")]),
                  value: "평점"),
              DropdownMenuItem(
                  child: Row(children: [Icon(Icons.check), Padding(padding: EdgeInsets.all(4)), Text("거리순")]),
                  value: "거리"),
              DropdownMenuItem(
                  child: Row(children: [Icon(Icons.check), Padding(padding: EdgeInsets.all(4)), Text("리뷰순")]),
                  value: "리뷰"),
            ];
          },
        ),
      ),
    );
  }


  // 카페 리스트 위젯
  Widget _cafeListWidget(List<Cafe> cafeList) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: searchCafeList.length,
          itemBuilder: (_, index) =>
              CafeListWidget(cafe: searchCafeList[index], onTap: null),
        ),
      ),
    );
  }
}
