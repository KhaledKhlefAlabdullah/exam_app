import 'package:exam_app/RegistrationPages/Email_Password_Page.dart';
import 'package:flutter/material.dart';

import '../API_Classes/UsersMethods.dart';
import '../Control_Panel_Pages/ControlPanelPage.dart';
import '../User_Pages/HomeUserPage.dart';

class SignInPage extends StatelessWidget {
  var signin_controller_name = TextEditingController();
  var signin_controller_email = TextEditingController();
  var signin_controller_password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGNIN"),
      ),
      body: Container(
          //add bckground image to the page
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/backgreound.gif"),
                  fit: BoxFit.cover)),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Form(
              key: formKey,
              child: Container(
                  width: 600,
                  height: 10,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: signin_controller_name,
                        keyboardType: TextInputType.name,
                        autofillHints: [AutofillHints.name],
                        validator: ((value) {
                          if (value!.isEmpty || value == null) {
                            return "empty name";
                          } else {
                            bool state =
                                RegExp("^[a-zA-Z][a-zA-Z\s]{0,20}[a-zA-Z]")
                                    .hasMatch(value);
                            if (!state) {
                              return "this is not name";
                            }
                          }
                        }),
                        decoration: InputDecoration(
                          labelText: "Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        style: TextStyle(
                          fontFamily: "",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          // اظهار نافذة منبثقة تعرض عند الضغط على زر
                                          title:
                                              Text("Signin"), // عنوان النافذة
                                          content: Text(
                                              "You alredy have acount do yo want to login"), // محتوى النافذة
                                          actions: [
                                            // الافعال في النافذة أي الازرار الموجودة
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                "/login");
                                                      },
                                                      child: Text("Yes")),
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text("No")),
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      });
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) {
                                    return HomeUser();
                                  }));
                                }
                              });
                            }
                          },
                          child: Text("SignIn"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Text("You have acount "),
                        Container(
                          width: 75,
                          height: 30,
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text("Login")),
                        ),
                        Text(" to your acount"),
                      ])
                    ],
                  )))),
    );
  }
}
