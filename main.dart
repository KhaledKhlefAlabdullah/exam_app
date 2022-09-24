import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      initialRoute: "/signin",
      routes: {
        "/login": (context) => LogInPage(),
        "/signin": (context) => SignInPage(),
      },
    );
  }
}
