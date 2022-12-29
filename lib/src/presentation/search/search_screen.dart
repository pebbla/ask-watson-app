import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/presentation/search/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.white,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                _searchTextField(viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _searchTextField(viewModel) {
    return Container(
      height: 56,
      child: TextField(
        onChanged: (text) => viewModel.onChanged(text),
        controller: _controller,
        focusNode: _focusNode,
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
    );
  }
}
