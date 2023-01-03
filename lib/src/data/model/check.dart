import 'package:ask_watson_app/src/data/model/theme.dart';

class Check {
  int? id;
  String? checkDt;
  Theme? theme;

  Check({this.id, this.checkDt, this.theme});

  Check.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    checkDt = json['checkDt'];
    theme = json['theme'] != null ? new Theme.fromJson(json['theme']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['checkDt'] = this.checkDt;
    if (this.theme != null) {
      data['theme'] = this.theme!.toJson();
    }
    return data;
  }
}