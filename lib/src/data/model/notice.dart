class Notice {
  int? id;
  String? title;
  String? content;
  String? createdAt;
  String? modifiedAt;

  Notice({this.id, this.title, this.content, this.createdAt, this.modifiedAt});

  Notice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}