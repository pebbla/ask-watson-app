import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:ask_watson_app/src/presentation/main/main_view_model.dart';
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

  const MainView(
      {super.key, required this.viewModel, required this.viewModelWatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildSearchBar(context),
                _buildCategoryList(context),
                _buildCafeList(context),
                _buildThemeList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 120,
            child: Container(),),

          Flexible(
            child: Container(
              height: 56,
              child: TextField(
                onChanged: (text) => viewModelWatch.onChanged(),
                controller: viewModel.controller,
                focusNode: viewModel.focusNode,
                decoration: InputDecoration(
                    isDense: true,
                    prefix: Icon(
                      Icons.search,
                      color: MyColor.grey,
                    ),
                    hintText: '검색어를 입력하세요',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:BorderSide(color: MyColor.grey)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:BorderSide(color: MyColor.grey))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 카테고리
  Widget _buildCategoryList(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('카테고리', style: MyTextStyle.black18w600),
          Padding(padding: EdgeInsets.all(8)),
          Row(
            children: [
              _categoryItem('', '스릴러'),
              Padding(padding: EdgeInsets.all(8)),
              _categoryItem('', '스릴러'),
              Padding(padding: EdgeInsets.all(8)),
              _categoryItem('', '스릴러'),
              Padding(padding: EdgeInsets.all(8)),
              _categoryItem('', '스릴러'),
            ],
          )
        ],
      ),
    );
  }

  // 카테고리 아이템
  Widget _categoryItem(String image_url, String categoryName) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Image.asset('assets/auth/kakao_logo_icon.png'),
          ),
          Padding(padding: EdgeInsets.all(4)),
          Text(categoryName, style: MyTextStyle.black12w500,)
        ],
      ),
    );
  }



  // 카페 리스트
  Widget _buildCafeList(BuildContext context) {
    Cafe cafe = Cafe();
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('카페', style: MyTextStyle.black18w600),
              TextButton(
                onPressed: () {
                  //TODO : 카페리스트 페이지로 이동
                },
                child: Text('더보기 >', style: MyTextStyle.black12w500),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          Row(children: [
            _cafeItem(cafe),
            Padding(padding: EdgeInsets.all(4)),
            _cafeItem(cafe),

          ],)
        ],
      ),
    );
  }



  // 카페 아이템
  Widget _cafeItem(Cafe cafe) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24))),
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 140,
              //TODO : 사진 넣기
              child: Container(),
            ),
            Text(cafe.cafeName ?? ''),
            // TODO : star widget
            Row(
              children: [
                // star widget,
                Text('${cafe.rating}')
              ],
            ),
          ],
        ),
      ),
    );
  }


  // 테마 리스트
  Widget _buildThemeList(BuildContext context) {
    m.Theme theme = m.Theme();
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('테마', style: MyTextStyle.black18w600),
              TextButton(
                onPressed: () {
                  //TODO : 카페리스트 페이지로 이동
                },
                child: Text('더보기 >', style: MyTextStyle.black12w500),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          Row(children: [
            _themeItem(theme),
            Padding(padding: EdgeInsets.all(4)),
            _themeItem(theme),

          ],)
        ],
      ),
    );
  }



  // 테마 아이템
  Widget _themeItem(m.Theme theme) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24))),
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 140,
              //TODO : 사진 넣기
              child: Container(),
            ),
            Text(theme.themeName ?? ''),
            // TODO : star widget
            Row(
              children: [
                // star widget,
                Text('${theme.rating}')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
