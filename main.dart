import 'package:exam_app/My_Providers_Pages/DeleteProvider.dart';
import 'package:exam_app/My_Providers_Pages/InsertProvider.dart';
import 'package:exam_app/My_Providers_Pages/Questions_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Control_Panel_Pages/ControlPanelPage.dart';
import 'Control_Panel_Pages/Insert/InsertQuestionsAndAnswers.dart';
import 'RegistrationPages/LogInPage.dart';
import 'RegistrationPages/SignInPage.dart';
import 'User_Pages/HomeUserPage.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Questions_Provider>(
        create: (context) => Questions_Provider()),
    ChangeNotifierProvider<Insert_Provider>(
        create: ((context) => Insert_Provider())),
    ChangeNotifierProvider<DeleteProvider>(
        create: ((context) => DeleteProvider()))
  ], child: MyApp()));
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
