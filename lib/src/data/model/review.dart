class Review {
  int? id;
  String? content;
  num? rating;
  int? activity;
  int? deviceRatio;
  int? difficulty;
  int? timeTaken;
  int? usedHintNum;
  String? createdAt;
  String? modifiedAt;

  Review(
      {this.id,
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