// ignore_for_file: file_names

class Users {
  int? id;
  String? userName;
  String? email;
  String? password;

  Users({this.id, this.userName, this.email, this.password});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['User_Name'];
    email = json['Email'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['User_Name'] = this.userName;
    data['Email'] = this.email;
    data['Password'] = this.password;
    return data;
  }
}
