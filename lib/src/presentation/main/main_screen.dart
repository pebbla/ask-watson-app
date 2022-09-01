import 'package:ask_watson_app/src/data/repository/faq_repository_impl.dart';
import 'package:ask_watson_app/src/data/repository/notice_repository_impl.dart';
import 'package:ask_watson_app/src/domain/use_case/faq_use_case.dart';
import 'package:ask_watson_app/src/domain/use_case/notice_use_case.dart';
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

  const MainView({super.key, required this.viewModel, required this.viewModelWatch});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              TextButton(onPressed: (){
                 var usecase =  FaqUseCase(FaqRepositoryImpl());
                 usecase.getFaqById(2);

              }, child: Text('테스트를 위해서 눌러주세요')),

              _buildSearchBar(context),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            //TODO : 이미지 누끼 딴 후 변경
            child: Image.asset('assets/auth/kakao_logo_icon.png'),
          ),
          Flexible(
            child: TextField(
              onChanged: (text) => viewModelWatch.onChanged(),
              controller: viewModel.controller,
              focusNode: viewModel.focusNode,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container();

  }

}