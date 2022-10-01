import 'package:exam_app/My_Providers_Pages/Questions_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswersTab extends StatelessWidget {
  int i = 0;
  @override
  var subject_controller = TextEditingController();
  Widget build(BuildContext context) {
    if (i == 0) {
      Provider.of<Questions_Provider>(context, listen: false).getQuestions();
      i++;
    }
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
        padding: EdgeInsets.all(20),
        child: DataTable(columns: [
          DataColumn(label: Text("Question")),
          DataColumn(label: Text("Subject Name")),
          DataColumn(label: Text("Add Answers")),
        ], rows: [
          ...Provider.of<Questions_Provider>(context, listen: false)
              .lst
              .map((Q) {
            return DataRow(cells: [
              DataCell(Text("${Q.question}")),
              DataCell(Text("${Q.subjectName}")),
              DataCell(IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              )),
            ]);
          })
        ]),
      )
    ]));
  }
}
