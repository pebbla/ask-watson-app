class User {
  int? id;
  String? email;
  String? nickname;
  String? email;
  String? birth;
  String? gender;
  List<int>? userBirth;

  User(
      {this.id,
      this.nickname,
      this.email,
      this.birth,
      this.gender,
      this.marketingAgreeYn,
      this.createdAt,
      this.modifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['userNickname'];
    email = json['userEmail'];
    birth = json['userBirth'];
    gender = json['userGender'];
    marketingAgreeYn = json['marketingAgreeYn'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userNickname'] = nickname;
    data['userEmail'] = email;
    data['userBirth'] = birth;
    data['userGender'] = gender;
    data['marketingAgreeYn'] = marketingAgreeYn;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}