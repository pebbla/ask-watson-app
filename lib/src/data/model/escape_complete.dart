import 'package:ask_watson_app/src/data/model/theme.dart';

class EscapeComplete {
  int? id;
  String? escapeCompleteDt;
  Theme? theme;

  EscapeComplete({this.id, this.escapeCompleteDt, this.theme});

  EscapeComplete.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    escapeCompleteDt = json['escapeCompleteDt'];
    theme = json['theme'] != null ? new Theme.fromJson(json['theme']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['escapeCompleteDt'] = this.escapeCompleteDt;
    if (this.theme != null) {
      data['theme'] = this.theme!.toJson();
    }
    return data;
  }
}