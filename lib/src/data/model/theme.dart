import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/category.dart';

class Theme {
  int? activity;
  Category? category;
  Cafe? cafe;
  String? createdAt;
  int? deviceRatio;
  int? difficulty;
  int? escapeCount;
  int? heartCount;
  int? id;
  int? minNumPeople;
  String? modifiedAt;
  int? price;
  int? rating;
  String? reservationUrl;
  int? reviewCount;
  String? themeExplanation;
  String? themeName;
  int? timeLimit;

  Theme(
      {this.activity,
      this.category,
      this.cafe,
      this.createdAt,
      this.deviceRatio,
      this.difficulty,
      this.escapeCount,
      this.heartCount,
      this.id,
      this.minNumPeople,
      this.modifiedAt,
      this.price,
      this.rating,
      this.reservationUrl,
      this.reviewCount,
      this.themeExplanation,
      this.themeName,
      this.timeLimit});

  Theme.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
     cafe = json['cafe'] != null
        ? new Cafe.fromJson(json['cafe'])
        : null;
    createdAt = json['createdAt'];
    deviceRatio = json['deviceRatio'];
    difficulty = json['difficulty'];
    escapeCount = json['escapeCount'];
    heartCount = json['heartCount'];
    id = json['id'];
    minNumPeople = json['minNumPeople'];
    modifiedAt = json['modifiedAt'];
    price = json['price'];
    rating = json['rating'];
    reservationUrl = json['reservationUrl'];
    reviewCount = json['reviewCount'];
    themeExplanation = json['themeExplanation'];
    themeName = json['themeName'];
    timeLimit = json['timeLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.cafe != null) {
      data['cafe'] = this.cafe!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['deviceRatio'] = this.deviceRatio;
    data['difficulty'] = this.difficulty;
    data['escapeCount'] = this.escapeCount;
    data['heartCount'] = this.heartCount;
    data['id'] = this.id;
    data['minNumPeople'] = this.minNumPeople;
    data['modifiedAt'] = this.modifiedAt;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['reservationUrl'] = this.reservationUrl;
    data['reviewCount'] = this.reviewCount;
    data['themeExplanation'] = this.themeExplanation;
    data['themeName'] = this.themeName;
    data['timeLimit'] = this.timeLimit;
    return data;
  }
}