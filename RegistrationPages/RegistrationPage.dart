import 'package:exam_app/RegistrationPages/ElevatedBottun.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOM"),
      ),
      body: Center(
        child: Column(
          children: [Elevated("login", "LogIn"), Elevated("signin", "SignIn")],
        ),
      ),
    );
  }
}
