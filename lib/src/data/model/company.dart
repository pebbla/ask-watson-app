class Company {
  int? id;
  String? companyName;

  Company({this.id, this.companyName});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['companyName'] = this.companyName;
    return data;
  }
}