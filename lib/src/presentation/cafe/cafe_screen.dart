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
              _selectConditionWidget(context),
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


  // 조건 선택 위젯
  Widget _selectConditionWidget(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context, builder: (context) {
              return _conditionModal(context);
            });
          },
          child: _condition(context, "위치")),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context, builder: (context) {
              return _conditionModal(context);
            });
          },
          child: _condition(context, "외국어 가능")),
      ],
    );
  }

  
  // 조건 위젯
  Widget _condition(BuildContext context, String text, {bool changeable = false}) {
    final viewModel = context.watch<CafeViewModel>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: viewModel.focusConditionYn[text]! && changeable ? MyColor.lightlightGrey : MyColor.white,
        border: Border.all(color: MyColor.lightlightGrey),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(text, style: MyTextStyle.black14w500),
    );
  }


  // 조건 모달
  Widget _conditionModal(BuildContext context) {
    final viewModel = context.watch<CafeViewModel>();
    ScrollController _controller = ScrollController();
    _controller.addListener(() {
      if(_controller.offset <  300) {
        viewModel.changeFocusConditionYn('위치');
      } else {
        viewModel.changeFocusConditionYn('외국어 가능');
      }
    });
    return Container(
      padding: const EdgeInsets.all(12),
      height: 500,
      child: Column(
        children: [
          Row(
            children: [
              _condition(context, "위치", changeable: true),
              _condition(context, "외국어 가능", changeable: true),
            ],
          ),
          const Divider(thickness: 0.5),
          const Padding(padding: EdgeInsets.all(2)),
          // TODO : 외국어 가능 스와이프로 넘기기
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  locationModalWidget(context),
                  foreignModalWidget(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  // 위치 모달 위젯
  Widget locationModalWidget(BuildContext context) {
    final viewModel = context.watch<CafeViewModel>();
    return Container(
      width: MediaQuery.of(context).size.width-24,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.stateList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => viewModel.changeCityListByState(viewModel.stateList[index]),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColor.lightlightGrey),
                      color: viewModel.selectedState == viewModel.stateList[index]
                              ? MyColor.lightlightGrey
                              : MyColor.white),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(viewModel.stateList[index]),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.cityList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColor.lightlightGrey),
                      color: MyColor.white),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(viewModel.cityList[index].city),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // 외국어 가능 선택
  Widget foreignModalWidget(BuildContext context) {
    final viewModel = context.watch<CafeViewModel>();
    return Container(
      width: MediaQuery.of(context).size.width-24,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: viewModel.foreignYn['영어'],
                onChanged: (value) {
                  viewModel.changeForeignYn('영어', value!);
                },
                activeColor: MyColor.black,
              ),
              const Text('영어')
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: viewModel.foreignYn['중국어'],
                onChanged: (value) {
                  viewModel.changeForeignYn('중국어', value!);
                },
                activeColor: MyColor.black,
              ),
              const Text('중국어')
            ],
          ),
        ],
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
