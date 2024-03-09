import 'package:ask_watson_app/src/config/theme/text_style.dart';
import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/presentation/cafe_detail/cafe_detail_view_model.dart';
import 'package:ask_watson_app/src/presentation/cafe_detail/modify_dialog_widget.dart';
import 'package:ask_watson_app/src/presentation/theme/theme_detail_screen.dart';
import 'package:ask_watson_app/src/presentation/widget/button.dart';
import 'package:ask_watson_app/src/presentation/widget/star_widget.dart';
import 'package:ask_watson_app/src/presentation/widget/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CafeDetailScreen extends StatelessWidget {
  final Cafe cafe;
  const CafeDetailScreen({super.key, required this.cafe});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CafeDetailViewModel>(
      create: (context) => CafeDetailViewModel(cafe.id),
      child: CafeDetailView(cafe: cafe),
    );
  }
}


class CafeDetailView extends StatelessWidget {
  final Cafe cafe;
  const CafeDetailView({super.key, required this.cafe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${cafe.name}", style: MyTextStyle.black18w600),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => _showDialog(context),
              icon: const Icon(Icons.settings)),
        ],
      ),
      floatingActionButton: _buildCafeUrlBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCafeInfo(context),
              _buildThemeList(context),
              const Padding(padding: EdgeInsets.all(24))
            ],
          ),
        ),
      ),
    );
  }


  /**
   * 카페 정보 노출 UI
   */
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
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse('tel://${cafe.phoneNum}'));
                },
                child: Row(
                  children: [
                    const Icon(Icons.phone, size: 16),
                    const Padding(padding: EdgeInsets.all(4)),
                    Text("${cafe.phoneNum}"),
                  ],
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ],
    );
  }

  /**
   * theme list UI
   */
  Widget _buildThemeList(BuildContext context) {
    final viewModel = context.watch<CafeDetailViewModel>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: viewModel.themeList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ThemeGrid2Widget(
            theme: viewModel.themeList[index],
            onHeartTap: null,
            onThemeTap: () {
              Navigator.push(
                  context,MaterialPageRoute(
                      builder: (context) => ThemeDetailScreen(
                          theme: viewModel.themeList[index])));
            },
          );
        },
      ),
    );
  }

  /**
   * cafe website 이동 UI
   */
  Widget _buildCafeUrlBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ButtonPrimaryWidget(
        text: '예약하러가기',
        onPressed: () async {
          Uri url = Uri.parse(cafe.website ?? '');
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
      ),
    );
  }

  /**
   * 카페 정보 수정 요청 dialog 
   */
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return ModifyDialogWidget();
      },
    );
  }
}
