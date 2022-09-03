import 'package:ask_watson_app/src/data/model/company.dart';
import 'package:ask_watson_app/src/data/model/geography.dart';
import 'package:ask_watson_app/src/data/model/location.dart';

class Cafe {
  int? id;
  String? name;
  String? cafePhoneNum;
  Location? location;
  Company? company;
  Geography? geography;
  int? reviewCount;
  double? rating;
  bool? englishPossible;

  Cafe(
      {this.id,
      this.name,
      this.cafePhoneNum,
      this.location,
      this.company,
      this.geography,
      this.reviewCount,
      this.rating,
      this.englishPossible});

  Cafe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['cafeName'];
    cafePhoneNum = json['cafePhoneNum'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    geography = json['geography'] != null
        ? new Geography.fromJson(json['geography'])
        : null;
    reviewCount = json['reviewCount'];
    rating = json['rating'];
    englishPossible = json['englishPossible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cafeName'] = this.name;
    data['cafePhoneNum'] = this.cafePhoneNum;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.geography != null) {
      data['geography'] = this.geography!.toJson();
    }
    data['reviewCount'] = this.reviewCount;
    data['rating'] = this.rating;
    data['englishPossible'] = this.englishPossible;
    return data;
  }
}