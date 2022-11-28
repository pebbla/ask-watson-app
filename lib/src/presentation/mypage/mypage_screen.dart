import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/mypage/mypage_view_model.dart';
import 'package:ask_watson_app/src/presentation/provider/app_set_up.dart';
import 'package:ask_watson_app/src/presentation/setting/setting_screen.dart';
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
          padding: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                _buildUserInfo(context),
                _buildTabBar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // user 정보
  Widget _buildUserInfo(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Image.asset('assets/character/watson_raise_left_hand.png'),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('룰루랄라 셜록홈즈님', style: MyTextStyle.black18w600),
              Padding(padding: EdgeInsets.all(2)),
              Text('지금까지 27번 탈출하셨습니다.', style: MyTextStyle.grey14w500)
            ],
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingScreen();
              }));
            },
            icon: Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  // 탭바
  Widget _buildTabBar(BuildContext context) {
    bool grideView = Provider.of<SetUp>(context).isGridView;

    return Expanded(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(4)),
          const TabBar(
            labelColor: MyColor.black,
            unselectedLabelColor: MyColor.lightlightGrey,
            indicatorColor: MyColor.black,
            tabs: [
              Tab(child: Icon(Icons.heart_broken)),
              Tab(child: Icon(Icons.heart_broken)),
            ],
          ),
          Padding(padding: EdgeInsets.all(4)),
          Expanded(
            child: TabBarView(
              children: [
                grideView
                    ? _buildEscapeCompleteTab()
                    : _buildEscapeCompleteListTab(),
                grideView
                    ? _buildHeartGridTab()
                    : _buildHeartListTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 탈출 완료 그리드 탭
  Widget _buildEscapeCompleteTab() {
    m.Theme theme = m.Theme();
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 11,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.54,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        // TODO : 좋아요 선택
        return ThemeGridWidget(theme: theme, isItGrid: true, onLikeTap: null,);
      },
    );
  }

  // 탈출 완료 리스트 탭
  Widget _buildEscapeCompleteListTab() {
    m.Theme theme = m.Theme();
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ThemeListWidget(theme: theme);
      },
    );
  }

  // 좋아요 탭
  Widget _buildHeartGridTab() {
    m.Theme theme = m.Theme();
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 11,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.54,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        // TODO : 좋아요 선택
        return ThemeGridWidget(theme: theme, isItGrid: true, onLikeTap: null,);
      },
    );
  }

  // 좋아요 리스트 탭
  Widget _buildHeartListTab() {
    m.Theme theme = m.Theme();
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ThemeListWidget(theme: theme);
      },
    );
  }
}
