import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
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
              _selectConditionWidget(),
              const Divider(color: MyColor.lightGrey, thickness: 1),
              _sortingConditionBtn(),
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


  // 조건 선택 위젯
  Widget _selectConditionWidget() {
    return Row(
      children: [
        // TODO : onTap -> 위치 모달, 외국어 가능 모달
        _condition("위치"),
        _condition("외국어 가능"),
      ],
    );
  }

  
  // 조건 위젯
  Widget _condition(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: MyColor.lightlightGrey),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(text, style: MyTextStyle.black14w500),
    );
  }


  // 정렬 조건 선택 위젯
  Widget _sortingConditionBtn() {
    return GestureDetector(
      onTap: () {
        // TODO : 정렬 조건 drawer 나타내기
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.list),
            Padding(padding: EdgeInsets.all(1)),
            Text("정렬"),
            Icon(Icons.arrow_drop_down_sharp, size: 16),
          ],
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
