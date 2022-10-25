import 'package:ask_watson_app/src/data/data_source/local_data_source/accept_term.dart';
import 'package:ask_watson_app/src/presentation/auth/accept_term_view_model.dart';
import 'package:ask_watson_app/src/presentation/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptTermScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AcceptTermViewModel>(
      create: (context) => AcceptTermViewModel(),
      child: AcceptTermView(),
    );
  }
}

class AcceptTermView extends StatelessWidget {
  
  final List<AcceptTerm> _list = AcceptTermList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    var viewModel = Provider.of<AcceptTermViewModel>(context);
    var viewModelWatch = Provider.of<AcceptTermViewModel>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '약관 동의',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(padding: EdgeInsets.all(24)),
              Container(
                padding: EdgeInsets.all(4),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(2)),
                        GestureDetector(
                          onTap: () => viewModelWatch.setAgreementAll(),
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.check,
                              color: viewModel.isAgreementAll() ? Colors.black : Colors.red,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Text('전체 동의')
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black26,
                  ),
                  _listItem(context, _list[0]),
                  _listItem(context, _list[1]),
                  _listItem(context, _list[2]),
                  _listItem(context, _list[3]),
                ]),
              )
            ],
          ),
          viewModel.checkEnableBtn()
          ? ButtonPrimaryWidget(text: '시작하기', onPressed: (){
          })
          : ButtonDisabledWidget(text: '시작하기')
        ],
      ),
    );
  }


  // 약관 동의 아이템
  Widget _listItem(BuildContext context, AcceptTerm item) {
    var viewModel = Provider.of<AcceptTermViewModel>(context);
    var viewModelWatch = Provider.of<AcceptTermViewModel>(context, listen: false);

    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(2)),
          GestureDetector(
            onTap: () => viewModelWatch.setAgreement(item.id-1),
            child: Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.check,
                color: viewModel.agreementList[item.id - 1]
                    ? Colors.black
                    : Colors.pink,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(2)),
          Text('${item.title} (${item.isRequired ? '필수' : '선택'})')
        ],
      ),
    );
  }
}
