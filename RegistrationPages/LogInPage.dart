import 'package:flutter/material.dart';
import '../API_Classes/UsersMethods.dart';
import '../Control_Panel_Pages/ControlPanelPage.dart';
import '../User_Pages/HomeUserPage.dart';
import 'Email_Password_Page.dart';

class LogInPage extends StatelessWidget {
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
                  Email_Password(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          UsersMethods.loginUsers(
                                  Email_Password.email_controler.text,
                                  Email_Password.password_controler.text)
                              .then((value) {
                            if (value) {
                              UsersMethods.getUser_detales(
                                      Email_Password.email_controler.text)
                                  .then((value) {
                                if (value == "addmin") {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) {
                                    return ControlPanel();
                                  }));
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) {
                                    return HomeUser();
                                  }));
                                }
                              });
                            }
                          });
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
