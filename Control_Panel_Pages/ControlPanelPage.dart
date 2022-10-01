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
                          },
                          icon: const Icon(Icons.insert_chart)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("insert quistion and answers")
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.update)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("update quistion and answers")
                    ],
                  ),
                ))
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
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.view_array)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("view quistion and answers")
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("delte quistion and answers")
                    ],
                  ),
                ))
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
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.system_update)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("update users")
                    ],
                  ),
                ))
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
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.view_array_outlined)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("view users")
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline)),
                      SizedBox(
                        height: 3,
                      ),
                      Text("delte users")
                    ],
                  ),
                ))
              ],
            )),
            SizedBox(
              height: 5,
            )
          ]),
        ));
  }
}
