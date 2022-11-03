class User {
  int? id;
  String? nickname;
  String? phoneNum;
  String? birth;
  String? gender;
  bool? marketingAgreeYn;
  String? createdAt;
  String? modifiedAt;

  User(
      {this.id,
      this.nickname,
      this.phoneNum,
      this.birth,
      this.gender,
      this.marketingAgreeYn,
      this.createdAt,
      this.modifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['userNickname'];
    phoneNum = json['userPhoneNum'];
    birth = json['userBirth'];
    gender = json['userGender'];
    marketingAgreeYn = json['marketingAgreeYn'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userNickname'] = this.nickname;
    data['userPhoneNum'] = this.phoneNum;
    data['userBirth'] = this.birth;
    data['userGender'] = this.gender;
    data['marketingAgreeYn'] = this.marketingAgreeYn;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}