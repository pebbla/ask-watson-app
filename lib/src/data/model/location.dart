class Location {
  late int id;
  late String state;
  late String city;

  Location({required this.id, required this.state, required this.city});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['state'] = state;
    data['city'] = city;
    return data;
  }
}