import 'package:exam_app/My_Providers_Pages/DeleteProvider.dart';
import 'package:exam_app/My_Providers_Pages/Questions_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswersTab extends StatelessWidget {
  @override
  var subject_controller = TextEditingController();
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
        padding: EdgeInsets.all(2),
        child: DataTable(columns: [
          DataColumn(label: (Text("Question"))),
          DataColumn(label: Text("Subject")),
          DataColumn(label: Text("Answers")),
          DataColumn(label: Text("Update")),
          DataColumn(label: Text("Delete")),
        ], rows: [
          ...Provider.of<Questions_Provider>(context, listen: false)
              .lst
              .map((Q) {
            return DataRow(cells: [
              DataCell(Text("${Q.question}")),
              DataCell(Text("${Q.subjectName}")),
              DataCell(IconButton(
                onPressed: () {},
                icon: Icon(Icons.add, color: Colors.blue),
              )),
              DataCell(IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.update,
                  color: Colors.green,
                ),
              )),
              DataCell(IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          // اظهار نافذة منبثقة تعرض عند الضغط على زر
                          title: Text("delete"), // عنوان النافذة
                          content: Text(
                              "You sure you want to deleted"), // محتوى النافذة
                          actions: [
                            // الافعال في النافذة أي الازرار الموجودة
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                  flex: 1,
                                ),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Provider.of<DeleteProvider>(context,
                                                  listen: false)
                                              .deleteQuestion(
                                                  Q.id,
                                                  Provider.of<Questions_Provider>(
                                                          context,
                                                          listen: false)
                                                      .lst,
                                                  Q);
                                          Provider.of<Questions_Provider>(
                                                  context,
                                                  listen: false)
                                              .getQuestions();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Yes")),
                                    flex: 2),
                                Expanded(
                                  child: Container(),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("No")),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 1,
                                ),
                              ],
                            )
                          ],
                        );
                      });
                },
                icon: Icon(Icons.delete, color: Colors.red),
              )),
            ]);
          })
        ]),
      )
    ]));
  }
}
