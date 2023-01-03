import 'package:ask_watson_app/src/data/model/geography.dart';
import 'package:ask_watson_app/src/data/model/location.dart';

class Cafe {
  int? id;
  String? name;
  String? phoneNum;
  Location? location;
  String? website;
  String? address;
  String? imageUrl;
  Geography? geography;
  int? reviewCount;
  num? rating;
  bool? isEnglishPossible;
  bool? available;

  Cafe(
      {this.id,
      this.name,
      this.phoneNum,
      this.location,
      this.website,
      this.address,
      this.imageUrl,
      this.geography,
      this.reviewCount,
      this.rating,
      this.isEnglishPossible,
      this.available});

  Cafe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['cafeName'];
    phoneNum = json['cafePhoneNum'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    website = json['website'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    geography = json['geography'] != null
        ? new Geography.fromJson(json['geography'])
        : null;
    reviewCount = json['reviewCount'];
    rating = json['rating'];
    isEnglishPossible = json['isEnglishPossible'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cafeName'] = this.name;
    data['cafePhoneNum'] = this.phoneNum;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['website'] = this.website;
    data['address'] = this.address;
    data['imageUrl'] = this.imageUrl;
    if (this.geography != null) {
      data['geography'] = this.geography!.toJson();
    }
    data['reviewCount'] = this.reviewCount;
    data['rating'] = this.rating;
    data['isEnglishPossible'] = this.isEnglishPossible;
    data['available'] = this.available;
    return data;
  }
}