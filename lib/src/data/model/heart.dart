import 'package:ask_watson_app/src/data/model/theme.dart';

class heart {
  int? id;
  Theme? theme;

  heart({this.id, this.theme});

  heart.fromJson(Map<String, dynamic> json) {
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