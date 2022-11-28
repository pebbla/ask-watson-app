import 'package:ask_watson_app/src/data/model/theme.dart';

class Heart {
  int? id;
  Theme? theme;

  Heart({this.id, this.theme});

  Heart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    theme = json['themeDto'] != null
        ? new Theme.fromJson(json['themeDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.theme != null) {
      data['themeDto'] = this.theme!.toJson();
    }
    return data;
  }
}