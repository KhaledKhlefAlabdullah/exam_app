import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'RegistrationPages/RegistrationPage.dart';
import 'RegistrationPages/LogInPage.dart';
import 'RegistrationPages/SignInPage.dart';

void main(List<String> args) {
  runApp(
      //MultiProvider(providers: [], child: MyApp())
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      initialRoute: "/",
      routes: {
        "/": (context) => RegistrationPage(),
        "/login": (context) => LogInPage(),
        "/signin": (context) => SignInPage(),
      },
    );
  }
}
