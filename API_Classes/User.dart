class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? average;

  Users({this.id, this.firstName, this.lastName, this.average});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    average = json['average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['average'] = this.average;
    return data;
  }
}
