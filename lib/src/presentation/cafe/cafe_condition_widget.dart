import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/cafe/cafe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeConditionModalWidget extends StatelessWidget {

  
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CafeViewModel>();
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


  // 조건 위젯
  Widget _condition(BuildContext context, String text, {bool changeable = false}) {
    final viewModel = context.watch<CafeViewModel>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: viewModel.curPage == text ? MyColor.white : MyColor.lightlightGrey,
        border: Border.all(color: MyColor.lightlightGrey),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(text, style: MyTextStyle.black14w500),
    );
  }

  // 위치 모달 위젯
  Widget locationModalWidget(BuildContext context) {
    final viewModel = context.watch<CafeViewModel>();
    return Container(
      width: MediaQuery.of(context).size.width-24,
      child: ListView(
        children: [
          viewModel.selectedLocationList.length == 0 ? Container() :  Container(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.selectedLocationList.length,
              itemBuilder: (context, index) => Container( // 선택된 Location item
                decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                height: 20,
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(viewModel.selectedLocationList[index].city),
                    IconButton(
                        onPressed: () {
                          viewModel.removeCity(viewModel.selectedLocationList[index]);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.stateList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => viewModel.getCities(viewModel.stateList[index]),
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
                    onTap: () {
                      viewModel.putCity(viewModel.cityList[index], context);
                    },
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
          //   children: [
          //     Checkbox(
          //       value: viewModel.foreignYn['영어'],
          //       onChanged: (value) {
          //         viewModel.changeForeignYn('영어', value!);
          //       },
          //       activeColor: MyColor.black,
          //     ),
          //     const Text('영어')
          //   ],
          // ),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: viewModel.foreignYn['중국어'],
          //       onChanged: (value) {
          //         viewModel.changeForeignYn('중국어', value!);
          //       },
          //       activeColor: MyColor.black,
          //     ),
          //     const Text('중국어')
          //   ],
          ),
        ],
      ),
    );
  }

}
