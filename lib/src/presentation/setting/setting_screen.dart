import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/provider/app_set_up.dart';
import 'package:ask_watson_app/src/presentation/setting/setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingViewModel>(
      create: (context) => SettingViewModel(),
      builder: (context, child) {
        return SettingView(
          viewModel: Provider.of<SettingViewModel>(context),
          viewModelWatch: Provider.of<SettingViewModel>(context, listen: false),
        );
      },
    );
  }
}

class SettingView extends StatelessWidget {
  final viewModel;
  final viewModelWatch;

  const SettingView(
      {super.key, required this.viewModel, required this.viewModelWatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MyColor.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTop(),
              Divider(color: MyColor.grey, thickness: 1),
              _buildBody(context),
              Divider(color: MyColor.grey, thickness: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTop(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('설정', style: MyTextStyle.black18w600,),
        Padding(padding: EdgeInsets.all(12)),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _settingItem('개인정보 수정', (){}),
          _settingItem('앱설정', (){}),
          _settingItem('로그아웃', (){}),
          _settingItem('회원탈퇴', (){}),
          _settingItem('개인정보 수정', (){}),
          _testToggle(context),
        ],
      ),
    );
  }

  Widget _settingItem(String title, Function onTap) {
    return Container(
      child: TextButton(
        onPressed: () => onTap(),
        child: Text(title, style: MyTextStyle.black16w500, textAlign: TextAlign.left),
      ),
    );
  }


  Widget _testToggle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('바툭판 스타일로 보기',
              style: MyTextStyle.black16w500, textAlign: TextAlign.left),
          Switch(
            value: Provider.of<SetUp>(context).isGridView,
            onChanged: (value) {
              Provider.of<SetUp>(context, listen: false).changeViewStyle(value);
            },
          ),
        ],
      ),
    );
  }
}
