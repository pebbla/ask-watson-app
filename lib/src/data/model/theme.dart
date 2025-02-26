import 'package:ask_watson_app/src/data/model/cafe.dart';
import 'package:ask_watson_app/src/data/model/category.dart';

class Theme {
  int? id;
  String? name;
  String? explanation;
  Category? category;
  double? difficulty;
  int? timeLimit;
  int? minNumPeople;
  int? price;
  String? reservationUrl;
  String? imageUrl;
  int? heartCount;
  int? checkCount;
  int? reviewCount;
  double? rating;
  num? deviceRatio;
  num? activity;
  Cafe? cafe;
  bool? available;
  bool? hearted;
  bool? checked;

  Theme(
      {this.id,
      this.name,
      this.explanation,
      this.category,
      this.difficulty,
      this.timeLimit,
      this.minNumPeople,
      this.price,
      this.reservationUrl,
      this.imageUrl,
      this.heartCount,
      this.checkCount,
      this.reviewCount,
      this.rating,
      this.deviceRatio,
      this.activity,
      this.cafe,
      this.available,
      this.hearted,
      this.checked,
      });

  Theme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['themeName'];
    explanation = json['themeExplanation'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    difficulty = json['difficulty'];
    timeLimit = json['timeLimit'];
    minNumPeople = json['minNumPeople'];
    price = json['price'];
    reservationUrl = json['reservationUrl'];
    imageUrl = json['imageUrl'];
    heartCount = json['heartCount'];
    checkCount = json['checkCount'];
    reviewCount = json['reviewCount'];
    rating = json['rating'];
    deviceRatio = json['deviceRatio'];
    activity = json['activity'];
    cafe = json['cafe'] != null ? new Cafe.fromJson(json['cafe']) : null;
    available = json['available'];
    hearted = json['hearted'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['themeName'] = this.name;
    data['themeExplanation'] = this.explanation;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['difficulty'] = this.difficulty;
    data['timeLimit'] = this.timeLimit;
    data['minNumPeople'] = this.minNumPeople;
    data['price'] = this.price;
    data['reservationUrl'] = this.reservationUrl;
    data['imageUrl'] = this.imageUrl;
    data['heartCount'] = this.heartCount;
    data['checkCount'] = this.checkCount;
    data['reviewCount'] = this.reviewCount;
    data['rating'] = this.rating;
    data['deviceRatio'] = this.deviceRatio;
    data['activity'] = this.activity;
    if (this.cafe != null) {
      data['cafe'] = this.cafe!.toJson();
    }
    data['available'] = this.available;
    data['hearted'] = this.hearted;
    data['checked'] = this.checked;
    return data;
  }
}