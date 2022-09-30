import 'package:exam_app/Control_Panel_Pages/InsertQuestionsAndAnswers.dart';
import 'package:exam_app/User_Pages/HomeUserPage.dart';
import 'package:flutter/material.dart';

import 'Control_Panel_Pages/ControlPanelPage.dart';
import 'RegistrationPages/LogInPage.dart';
import 'RegistrationPages/SignInPage.dart';

void main(List<String> args) {
  runApp(//MultiProvider(providers: [
      //   ChangeNotifierProvider<>(
      //       create: (context) => ()),
      // ], child: MyApp())
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      initialRoute: "/controlporde",
      //"/signin",//just for now
      routes: {
        "/homeUser": (context) => HomeUser(),
        "/login": (context) => LogInPage(),
        "/signin": (context) => SignInPage(),
        "/controlporde": (context) => ControlPanel(),
        "/insertQuestionsAndAnswers": (context) => InsertQuestionsAndAnswers(),
      },
    );
  }
}
