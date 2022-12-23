import 'package:flutter/material.dart';
import 'package:ask_watson_app/src/data/model/theme.dart' as m;

class ThemeDetailScreen extends StatelessWidget {
  final m.Theme theme;

  const ThemeDetailScreen({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _themeDetailTop()
            ],
          ),
        ),
      ),
    );
  }

  Widget _themeDetailTop() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${theme.name}', ),

                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
