class User {
  int? id;
  String? userNickname;
  String? userPhoneNum;
  String? userBirth;
  String? userGender;
  bool? marketingAgreeYn;
  String? createdAt;
  String? modifiedAt;

  User(
      {this.id,
      this.userNickname,
      this.userPhoneNum,
      this.userBirth,
      this.userGender,
      this.marketingAgreeYn,
      this.createdAt,
      this.modifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userNickname = json['userNickname'];
    userPhoneNum = json['userPhoneNum'];
    userBirth = json['userBirth'];
    userGender = json['userGender'];
    marketingAgreeYn = json['marketingAgreeYn'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userNickname'] = this.userNickname;
    data['userPhoneNum'] = this.userPhoneNum;
    data['userBirth'] = this.userBirth;
    data['userGender'] = this.userGender;
    data['marketingAgreeYn'] = this.marketingAgreeYn;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}