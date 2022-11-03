import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/data_source/local_data_source/accept_term.dart';
import 'package:ask_watson_app/src/presentation/auth/accept_term_view_model.dart';
import 'package:ask_watson_app/src/presentation/auth/certify_phone_num_screen.dart';
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
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: MyColor.grey)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    var viewModel = Provider.of<AcceptTermViewModel>(context);
    var viewModelWatch = Provider.of<AcceptTermViewModel>(context, listen: false);

    return Container(
      padding: const EdgeInsets.only(bottom :24 , top :24, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(width: 12),
                  Text('약관 동의', style: MyTextStyle.black21w600),
                ],
              ),
              const Padding(padding: EdgeInsets.all(12)),
              Container(
                padding: const EdgeInsets.all(4),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, bottom: 8),
                    child: Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(2)),
                        InkWell(
                          onTap: () => viewModelWatch.setAgreementAll(),
                          customBorder: const CircleBorder(),
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.check,
                              color: viewModel.isAgreementAll() ? MyColor.black : MyColor.unselectedGrey,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        const Text('전체 동의', style: TextStyle(fontSize: 16)),
                        const Padding(padding: EdgeInsets.all(2)),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.black26),
                  _listItem(context, _list[0]),
                  _listItem(context, _list[1]),
                  _listItem(context, _list[2]),
                  _listItem(context, _list[3]),
                ]),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: viewModel.checkEnableBtn()
            ? ButtonPrimaryWidget(text: '시작하기', onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CertifyPhoneNumScreen()));
            })
            : ButtonDisabledWidget(text: '시작하기'),
          )
        ],
      ),
    );
  }


  // 약관 동의 아이템
  Widget _listItem(BuildContext context, AcceptTerm item) {
    var viewModel = Provider.of<AcceptTermViewModel>(context);
    var viewModelWatch = Provider.of<AcceptTermViewModel>(context, listen: false);

    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(2)),
          InkWell(
            onTap: () => viewModelWatch.setAgreement(item.id-1),
            customBorder: const CircleBorder(),
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              width: 50,
              height: 50,
              child: Icon(
                Icons.check,
                color: viewModel.agreementList[item.id - 1]
                    ? MyColor.black
                    : MyColor.unselectedGrey,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(2)),
          GestureDetector(
            onTap: (){
              showModalBottomSheet(context: context, builder: (context) => _modalBottom(context, item));
            },
            child: Text(
              '${item.title} (${item.isRequired ? '필수' : '선택'})',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }


  // 약관 동의 설명 모달
  Widget _modalBottom(BuildContext context, AcceptTerm item) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: MyTextStyle.black18w600),
          const Padding(padding: EdgeInsets.all(12)),
          // TODO : Html viewer 사용
          Flexible(
            child: SingleChildScrollView(
              child: Text(item.text, style: MyTextStyle.black14w500),
            ),
          ),
        ],
      ),
    );
  }
}
