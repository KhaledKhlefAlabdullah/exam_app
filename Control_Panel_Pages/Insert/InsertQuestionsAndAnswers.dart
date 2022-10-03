import 'package:exam_app/My_Providers_Pages/Questions_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Drawer.dart';
import 'InsertAnswers.dart';
import 'InsertQuestions.dart';

class InsertQuestionsAndAnswers extends StatelessWidget {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      Provider.of<Questions_Provider>(context, listen: false).getQuestions();
      i++;
    }
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
          body: TabBarView(children: [QuestionTab(), AnswersTab()]),
        ));
  }
}
