import 'package:flutter/material.dart';

class QuestionTab extends StatelessWidget {
  @override
  var subject_controller = TextEditingController();
  var question_controller = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Insert Subject"),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: subject_controller,
                decoration: InputDecoration(
                    label: Text("Enter Subject"),
                    prefixIcon: Icon(Icons.subject)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.add_task_sharp),
                          SizedBox(
                            width: 5,
                          ),
                          Text("add subject")
                        ],
                      ))),
              SizedBox(
                height: 40,
              ),
              Text("add Questions for asubject"),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: question_controller,
                decoration: InputDecoration(
                    label: Text("Enter Question"),
                    prefixIcon: Icon(Icons.question_answer)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.add_box_sharp),
                          SizedBox(
                            width: 5,
                          ),
                          Text("add Question")
                        ],
                      ))),
            ],
          ),
        ));
  }
}
