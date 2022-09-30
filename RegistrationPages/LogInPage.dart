import 'package:exam_app/API_Classes/UsersMethods.dart';
import 'package:exam_app/RegistrationPages/Email_Password_Page.dart';
import 'package:flutter/material.dart';

import '../API_Classes/Users_Detales.dart';

class LogInPage extends StatelessWidget {
  var login_controller_email = TextEditingController();
  var login_controller_password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Container(
          // add bckground image to the page
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("images/backgreound.gif"),
          //         fit: BoxFit.cover)),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // I use the class who contanes at text form field to email and password
                  Email_Password(
                      login_controller_email, login_controller_password),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // UsersMethods.loginUsers(login_controller_email.text,
                          //     login_controller_password.text);
                          UsersMethods.getUser_Detales(1);
                        }
                      },
                      child: Text("Login"),
                    ),
                  ),
                ],
              ))),
    );
  }
}
