import 'dart:convert';

import 'package:exam_app/API_Classes/User.dart';
import 'package:exam_app/API_Classes/Users_Detales.dart';
import 'package:http/http.dart' as http; //استيراد مكتبةللاتصال بالسيرفر

class UsersMethods {
  static Future<bool> loginUsers(email, password) async {
    // دالة عرض بيانات الطلاب في الجدول
    var server = await http.get(Uri.http("127.0.0.1:8000", "/login", {
      "userName": "$email",
      "password": "$password"
    })); // استدعاء دالة ال اي بي ااي التي تفوم بعرض كل البيانات

    if (server.body.toString() == "true") {
      return true;
    } else {
      return false;
    }
  }

  static void getUser_Detales(userEmail) async {
    var server = await http.get(Uri.http("127.0.0.1:8000",
        "/select/Users_Detales", {"userEmail": "$userEmail"}));
    var type = jsonDecode(server.body
        .toString()); // اخذ اليبانات من قاعدة ابيانات وتخزينها في لائحة
    var lst = type.map((u) => User_Detales.fromJson(u)).toList();
    print(lst[0].userType[0]);
  }
}
