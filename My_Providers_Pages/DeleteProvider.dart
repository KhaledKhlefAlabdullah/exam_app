import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class DeleteProvider extends ChangeNotifier {
  //delete Question from Questions table
  void deleteQuestion(id, lst, que) async {
    // دالة تقوم بحذف بيانات سؤال
    var server = await http.post(Uri.http("127.0.0.1:8000", "/delete/questions",
        {"Id": "$id"})); // استدعاء دالة ال اي بي ااي التي تقوم بالحذف
    lst.remove(que);
    notifyListeners();
  }
}
