import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exam_app/API_Classes/Questions.dart';
import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class Insert_Provider with ChangeNotifier {
  void addSubjects(Subject_Name) async {
    // دالة عرض بيانات الاسألة في الجدول
    var server = await http.get(Uri.http("127.0.0.1:8000", "/insert/Subjects", {
      "Subject_Name": "$Subject_Name"
    })); // استدعاء دالة ال اي بي ااي التي تفوم بعرض كل البيانات
    notifyListeners();
  }
}
