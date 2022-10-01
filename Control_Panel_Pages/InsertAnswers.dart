import 'package:flutter/material.dart';

class AnswersTab extends StatelessWidget {
  @override
  var subject_controller = TextEditingController();
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
        padding: EdgeInsets.all(20),
        child: DataTable(columns: [
          DataColumn(label: Text("Question")),
          DataColumn(label: Text("Subject Name")),
          DataColumn(label: Text("Add Answers")),
        ], rows: [
          DataRow(cells: [
            DataCell(Text("1")),
            DataCell(Text("2")),
            DataCell(IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            )),
          ])
        ]),
      )
    ]));
  }
}
