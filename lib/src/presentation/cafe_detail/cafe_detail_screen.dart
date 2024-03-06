import 'package:ask_watson_app/src/config/theme/colors.dart';
import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:flutter/material.dart';

class CafeDetailScreen extends StatelessWidget {
  final Cafe cafe;

  const CafeDetailScreen({super.key, required this.cafe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${cafe.name}", style: MyTextStyle.black18w600),
      ),
      body: SafeArea(child: Column(
        children: [
          _buildCafeInfo(context),
          _buildThemeList(context),
        ],
      ), ),
    );
  }

  Widget _buildCafeInfo(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 1.1,
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.network(
              cafe.imageUrl ?? "",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(6)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${cafe.name}", style: MyTextStyle.black16w600),
              const Padding(padding: EdgeInsets.all(3)),
              StarWidget(rating: cafe.rating ?? 0.0),
              const Padding(padding: EdgeInsets.all(3)),
              Text("${cafe.phoneNum}"),
              const Divider()
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeList(BuildContext context) {
    return Column(
      
    );
  }
}
