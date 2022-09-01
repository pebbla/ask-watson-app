class Report {
  int? id;
  String? content;
  bool? handledYn;
  String? createdAt;
  String? modifiedAt;

  Report(
      {this.id, this.content, this.handledYn, this.createdAt, this.modifiedAt});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    handledYn = json['handledYn'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['handledYn'] = this.handledYn;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}