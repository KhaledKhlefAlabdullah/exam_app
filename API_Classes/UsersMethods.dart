import 'dart:convert';

import 'package:http/http.dart' as http;

import '../RegistrationPages/Email_Password_Page.dart'; //استيراد مكتبةللاتصال بالسيرفر

class UsersMethods {
  static Future<bool> loginUsers(email, password) async {
    // دالة عرض بيانات الطلاب في الجدول
    var server = await http.get(Uri.http("127.0.0.1:8000", "/login", {
      "email": "admin2001@jmail.com",
      "password": "Admin2001"
    })); // استدعاء دالة ال اي بي ااي التي تفوم بعرض كل البيانات
    print(server.body.toString());
    print(Email_Password.email_controler.text);
    if (server.body.toString() == "true") {
      return true;
    } else {
      return true;
    }
  }

  static Future<String> getUser_detales(userEmail) async {
    var server = await http.get(Uri.http("127.0.0.1:8000",
        "/select/User_Detales", {"userEmail": "admin2001@gmail.com"}));
    print(server.body.toString());
    if (server.body.toString() == "addmin") {
      return "addmin";
    } else {
      return "student";
    }
  }
}
