import 'package:exam_app/RegistrationPages/ElevatedBottun.dart';
import 'package:flutter/material.dart';

// build a page to signin or login
class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOM"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // to be in center page
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // I use a widget elevated to be elevated button
            Elevated("login", "LogIn"),
            SizedBox(
              height: 20,
            ),
            Elevated("signin", "SignIn")
          ],
        ),
      ),
    );
  }
}
