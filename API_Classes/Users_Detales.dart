class User_Detales {
  List<String>? userType;

  User_Detales({this.userType});

  User_Detales.fromJson(Map<String, dynamic> json) {
    userType = json['User_Type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_Type'] = this.userType;
    return data;
  }
}
