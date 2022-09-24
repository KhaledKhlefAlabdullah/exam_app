import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
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
                  //email text form field
                  TextFormField(
                    controller: signin_controller_email,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    validator: ((value) {
                      if (value!.isEmpty || value == null) {
                        return "empty Email";
                      } else {
                        bool state = RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}')
                            .hasMatch(value);
                        if (!state) {
                          return "this is not email";
                        }
                      }
                    }),
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    style: TextStyle(
                      fontFamily: "",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // password text form field
                  TextFormField(
                    controller: signin_controller_password,
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: [AutofillHints.password],
                    validator: ((value) {
                      if (value!.isEmpty || value == null) {
                        return "Password must be eight letters and contain numbers and a large character";
                      } else {
                        bool state =
                            RegExp("(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}")
                                .hasMatch(value);
                        if (!state) {
                          return "this password is not currect";
                        }
                      }
                    }),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
                    ),
                    style: TextStyle(
                      fontFamily: "",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, "/");
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
