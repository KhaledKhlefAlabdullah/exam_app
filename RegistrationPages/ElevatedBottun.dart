import 'package:flutter/material.dart';

// I create a widget to be elevated button
class Elevated extends StatelessWidget {
  var bath;
  var tital;
  Elevated(bath, tital) {
    this.bath = bath;
    this.tital = tital;
  }
  @override
  Container build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/$bath");
        },
        child: Text("$tital"),
      ),
    );
  }
}
