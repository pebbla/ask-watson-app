import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/category.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:ask_watson_app/src/data/repository/theme_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/theme_use_case.dart';
import 'package:ask_watson_app/src/presentation/cafe_detail/cafe_detail_screen.dart';
import 'package:ask_watson_app/src/presentation/main/main_view_model.dart';
import 'package:ask_watson_app/src/presentation/search/search_screen.dart';
import 'package:ask_watson_app/src/presentation/theme/theme_detail_screen.dart';
import 'package:ask_watson_app/src/presentation/widget/cafe_widget.dart';
import 'package:ask_watson_app/src/presentation/widget/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {

  final _tmUseCase = ThemeRepositoryImpl();

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<MainViewModel>();

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
                  _buildCategoryList(viewModel.categoryList),
                  _buildCafeList(context, viewModel.twoRandomCafe),
                  _buildThemeList(context, viewModel.twoRandomTheme),
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
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 90,
            height: 100,
            child: Image.asset('assets/character/watson_raise_left_hand.png'),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: MyColor.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                height: 56,
                child: Row(
                  children: const [
                    Icon(Icons.search, color: MyColor.grey),
                    Padding(padding: EdgeInsets.all(4)),
                    Text("검색어를 입력하세요", style: MyTextStyle.grey14w500),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 카테고리 리스트
  Widget _buildCategoryList(List<Category> categoryList) {
    return Container(
      padding: const EdgeInsets.only(bottom: 18, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('카테고리', style: MyTextStyle.black18w600),
          const Padding(padding: EdgeInsets.all(4)),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _categoryItem(categoryList[index]);
              },
              itemCount: categoryList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8);
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
                        // TODO: 카페 리스트 화면으로 이동
                      },
                      child: const Text('더보기 >', style: MyTextStyle.black12w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CafeGridWidget(
                      cafe: list[0],
                      onTap: null,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    CafeGridWidget(
                      cafe: list[1],
                      onTap: null,
                    ),
                  ],
                ),
              ],
            ),
          );
  }


  // 테마 리스트
  Widget _buildThemeList(BuildContext context, List<m.Theme> list) {
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
                        //TODO : 테마 리스트 페이지로 이동
                      },
                      child:
                          const Text('더보기 >', style: MyTextStyle.black12w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: ThemeGridWidget(
                        theme: list[0],
                        onThemeTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ThemeDetailScreen(theme: list[0])));
                        },
                        onHeartTap: () {},
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Flexible(
                      child: ThemeGridWidget(
                        theme: list[1],
                        onThemeTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ThemeDetailScreen(theme: list[1])));
                        },
                        onHeartTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
