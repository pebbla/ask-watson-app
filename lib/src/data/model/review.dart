import 'package:ask_watson_app/src/data/model/user.dart';

class Review {
  int? id;
  User? user;
  String? content;
  num? rating;
  num? activity;
  num? deviceRatio;
  num? difficulty;
  num? timeTaken;
  num? usedHintNum;
  String? createdAt;
  String? modifiedAt;

  Review(
      {this.id,
      this.user,
      this.content,
      this.rating,
      this.activity,
      this.deviceRatio,
      this.difficulty,
      this.timeTaken,
      this.usedHintNum,
      this.createdAt,
      this.modifiedAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    content = json['content'];
    rating = json['rating'];
    activity = json['activity'];
    deviceRatio = json['deviceRatio'];
    difficulty = json['difficulty'];
    timeTaken = json['timeTaken'];
    usedHintNum = json['usedHintNum'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['content'] = this.content;
    data['rating'] = this.rating;
    data['activity'] = this.activity;
    data['deviceRatio'] = this.deviceRatio;
    data['difficulty'] = this.difficulty;
    data['timeTaken'] = this.timeTaken;
    data['usedHintNum'] = this.usedHintNum;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}