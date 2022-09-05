import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/mypage/mypage_view_model.dart';
import 'package:ask_watson_app/src/presentation/widget/theme_widget.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MypageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MypageViewModel>(
      create: (context) => MypageViewModel(),
      builder: (context, child) {
        return MypageView(
          viewModel: Provider.of<MypageViewModel>(context),
          viewModelWatch: Provider.of<MypageViewModel>(context, listen: false),
        );
      },
    );
  }
}

class MypageView extends StatelessWidget {
  final viewModel;
  final viewModelWatch;

  const MypageView({
    super.key,
    required this.viewModel,
    required this.viewModelWatch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              _buildUserInfo(),
              _buildTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  // user 정보
  Widget _buildUserInfo() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 50, height: 150),
        Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('룰루랄라 셜록홈즈님', style: MyTextStyle.black18w600),
              Padding(padding: EdgeInsets.all(2)),
              Text('지금까지 27번 탈출하셨습니다.', style: MyTextStyle.grey14w500)
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            print('할로할로');
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  // 탭바
  Widget _buildTabBar() {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: Column(
          children: [
            const TabBar(
              labelColor: MyColor.black,
              unselectedLabelColor: MyColor.lightlightGrey,
              indicatorColor: MyColor.black,
              tabs: [
                Tab(child: Icon(Icons.heart_broken)),
                Tab(child: Icon(Icons.heart_broken)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildEscapeCompleteTab(),
                  _buildHeartTab()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 탈출 완료 탭 
  Widget _buildEscapeCompleteTab() {
    m.Theme theme = m.Theme();
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: GridView.builder(
        itemCount: 11, //item 개수
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 0.65, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
        ),
        itemBuilder: (BuildContext context, int index) {
          return ThemeWidget(theme: theme);
        },
      ),
    );
  }

  // 좋아요 탭
  Widget _buildHeartTab() {
    m.Theme theme = m.Theme();
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: GridView.builder(
        itemCount: 11,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ThemeWidget(theme: theme);
        },
      ),
    );
  }

}
