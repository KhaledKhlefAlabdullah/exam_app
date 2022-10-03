import 'package:provider/provider.dart';

import '../My_Providers_Pages/Questions_Provider.dart';
import 'Drawer.dart';
import 'package:flutter/material.dart';

class ControlPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Control Panel"),
        ),
        drawer: DrawerPage(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, "/insertQuestionsAndAnswers");
                            Provider.of<Questions_Provider>(context,
                                    listen: false)
                                .getQuestions();
                          },
                          icon: const Icon(Icons.insert_chart)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("insert quistion and answers")
                    ],
                  ),
                )),
              ],
            )),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("insert users")
                    ],
                  ),
                )),
              ],
            )),
            SizedBox(
              height: 5,
            )
          ]),
        ));
  }
}
