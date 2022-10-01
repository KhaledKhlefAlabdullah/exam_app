import 'package:flutter/material.dart';

import 'Drawer.dart';

class InsertQuestionsAndAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //لعمل تبويبات في الصفحة
        animationDuration:
            Duration(seconds: 1), //تحديد مدة الانتقال بين التبويبات

        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Insert Questions And Answers"),
              bottom: TabBar(tabs: [
                Column(children: [
                  Row(
                    children: [
                      Icon(Icons.insert_page_break),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Questions")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                ]),
                Column(children: [
                  Row(
                    children: [
                      Icon(Icons.insert_comment),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                ])
              ])),
          drawer: DrawerPage(),
          body: Text(""),
        ));
  }
}
