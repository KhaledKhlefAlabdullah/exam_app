class Questions {
  String? question;
  String? subjectName;

  Questions({this.question, this.subjectName});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['Question'];
    subjectName = json['Subject_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Question'] = this.question;
    data['Subject_Name'] = this.subjectName;
    return data;
  }
}
