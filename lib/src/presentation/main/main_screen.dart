import 'dart:math';

import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/category.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:ask_watson_app/src/presentation/main/main_view_model.dart';
import 'package:ask_watson_app/src/presentation/widget/cafe_widget.dart';
import 'package:ask_watson_app/src/presentation/widget/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
      builder: (context, child) {
        return MainView(
          viewModel: Provider.of<MainViewModel>(context),
          viewModelWatch: Provider.of<MainViewModel>(context, listen: false),
        );
      },
    );
  }
}

class MainView extends StatelessWidget {
  final viewModel;
  final viewModelWatch;

  const MainView({
    super.key,
    required this.viewModel,
    required this.viewModelWatch,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildSearchBar(context),
                  _buildCategoryList(context),
                  _buildCafeList(context, viewModel.cafeList),
                  _buildThemeList(context, viewModel.themeList),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 검색창
  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 90,
            height: 100,
            child: Image.asset('assets/character/watson_raise_left_hand.png')
          ),
          Flexible(
            child: Container(
              height: 56,
              child: TextField(
                onChanged: (text) => viewModelWatch.onChanged(),
                controller: viewModel.controller,
                focusNode: viewModel.focusNode,
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
            ),
          ),
        ],
      ),
    );
  }

  // 카테고리 리스트
  Widget _buildCategoryList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 18, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('카테고리', style: MyTextStyle.black18w600),
          const Padding(padding: EdgeInsets.all(4)),
          Container(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _categoryItem(viewModel.categoryList[index]);
              },
              itemCount: viewModel.categoryList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8);
              },
            ),
          ),
        ],
      ),
    );
  }

  // 카테고리 아이템
  Widget _categoryItem(Category category) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Image.asset('${category.getImageUrl()}'),
        ),
        const Padding(padding: EdgeInsets.all(4)),
        Text(category.name ?? '',
          style: MyTextStyle.black12w500,
        )
      ],
    );
  }
  

  // 카페 리스트
  Widget _buildCafeList(BuildContext context, List<Cafe> list) {
    Random random = new Random();

    return list.isEmpty
        ? Container()
        : Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('카페', style: MyTextStyle.black18w600),
                    TextButton(
                      onPressed: () {
                        //TODO : 카페리스트 페이지로 이동
                      },
                      child:
                          const Text('더보기 >', style: MyTextStyle.black12w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    CafeWidget(cafe: list[random.nextInt(list.length)]),
                    const Padding(padding: EdgeInsets.all(4)),
                    CafeWidget(cafe: list[random.nextInt(list.length)]),
                  ],
                ),
              ],
            ),
          );
  }


  // 테마 리스트
  Widget _buildThemeList(BuildContext context, List<m.Theme> list) {
    var viewModelWatch = Provider.of<MainViewModel>(context, listen: false);
    Random random = new Random();

    return list.isEmpty
        ? Container()
        : Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('테마', style: MyTextStyle.black18w600),
                    TextButton(
                      onPressed: () {
                        //TODO : 카페리스트 페이지로 이동
                      },
                      child:
                          const Text('더보기 >', style: MyTextStyle.black12w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: ThemeGridWidget(
                        theme: list[random.nextInt(list.length)],
                        onHeartTap: () {
                          
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Flexible(
                      child: ThemeGridWidget(
                        theme: list[random.nextInt(list.length)],
                        onHeartTap: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          );

  }


}
