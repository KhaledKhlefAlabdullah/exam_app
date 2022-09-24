import 'package:flutter/material.dart';

// I build aclass contanes at
class Email_Password extends StatelessWidget {
  var email_controler;
  var password_controler;
  Email_Password(email_controler, password_controler) {
    this.email_controler = email_controler;
    this.password_controler = password_controler;
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // text form field for email
      TextFormField(
        controller: email_controler,
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
        validator: ((value) {
          if (value!.isEmpty || value == null) {
            return "empty Email";
          } else {
            bool state = RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}').hasMatch(value);
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
      // text form field for password
      TextFormField(
        controller: password_controler,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: [AutofillHints.password],
        validator: ((value) {
          if (value!.isEmpty || value == null) {
            return "Password must be eight letters and contain numbers and a large character";
          } else {
            bool state = RegExp("(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}")
                .hasMatch(value);
            if (!state) {
              return "this password is not currect\nPassword must be eight letters and contain numbers and a large character";
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
      )
    ]);
  }
}
