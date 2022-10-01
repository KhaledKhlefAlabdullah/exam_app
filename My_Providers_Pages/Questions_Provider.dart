import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exam_app/API_Classes/Questions.dart';
import 'package:flutter/cupertino.dart';

class Questions_Provider extends ChangeNotifier {
  List<Questions> lst =
      []; // تم انشاء لائحة لتخزين اغراض من نوع سؤاال لعرضها في الصفحة
  void getStudents() async {
    // دالة عرض بيانات الاسألة في الجدول
    var server = await http.get(Uri.http("127.0.0.1:8000",
        "/select/Subjects_Questions")); // استدعاء دالة ال اي بي ااي التي تفوم بعرض كل البيانات
    print(server.body.toString());
    List<dynamic> lstd = jsonDecode(server.body
        .toString()); // اخذ اليبانات من قاعدة ابيانات وتخزينها في لائحة
    lst = lstd
        .map((q) => Questions.fromJson(q))
        .toList(); // اسناد  البيانات الي اللائحة الرئيسية التي سيتم عرضها في الصفح
    notifyListeners();
  }
}
