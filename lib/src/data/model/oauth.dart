import 'package:ask_watson_app/src/data/model/user.dart';

class OAuth {
  bool? isNew;
  String? accessToken;
  String? refreshToken;
  User? user;

  OAuth({this.isNew, this.accessToken, this.refreshToken, this.user});

  OAuth.fromJson(Map<String, dynamic> json) {
    isNew = json['isNew'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isNew'] = this.isNew;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}