class Location {
  int? id;
  String? state;
  String? city;

  Location({this.id, this.state, this.city});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['city'] = this.city;
    return data;
  }
}