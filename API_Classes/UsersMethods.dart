import 'dart:convert';

import 'package:exam_app/API_Classes/User.dart';
import 'package:http/http.dart' as http; //استيراد مكتبةللاتصال بالسيرفر

class UsersMethods {
  static var lst;
  static void getUsers() async {
    // دالة عرض بيانات الطلاب في الجدول
    var server = await http.get(Uri.http("127.0.0.1:8000",
        "/Students/Select")); // استدعاء دالة ال اي بي ااي التي تفوم بعرض كل البيانات
    print(server.body.toString());
    List<dynamic> lstd = jsonDecode(server.body
        .toString()); // اخذ اليبانات من قاعدة ابيانات وتخزينها في لائحة
    lst = lstd
        .map((s) => Users.fromJson(s))
        .toList(); // اسناد  البيانات الي اللائحة الرئيسية التي سيتم عرضها في الصفح
  }
}
