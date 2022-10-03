class Questions {
  int? id;
  String? question;
  String? subjectName;

  Questions({this.id, this.question, this.subjectName});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    question = json['Question'];
    subjectName = json['Subject_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Question'] = this.question;
    data['Subject_Name'] = this.subjectName;
    return data;
  }
}
