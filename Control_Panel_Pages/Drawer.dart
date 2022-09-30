import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Padding(padding: EdgeInsets.all(10.0)),
        Row(children: [
          Expanded(
              child: Container(
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person),
                  ),
                  color: Color.fromARGB(255, 88, 165, 189),
                  height: 80)),
          Expanded(
              child: Container(
                  child: Center(child: Text("User Name")),
                  color: Color.fromARGB(255, 88, 165, 189),
                  height: 80))
        ]),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Icon(Icons.info_outline),
            InkWell(
              onTap: () {},
              child: Text("abut us"),
            )
          ],
        )
      ],
    ));
  }
}
