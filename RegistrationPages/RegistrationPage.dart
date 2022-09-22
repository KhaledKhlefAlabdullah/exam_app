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
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Text("Login"),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/signin");
              },
              child: Text("Signin"),
            ),
          ],
        ),
      ),
    );
  }
}
