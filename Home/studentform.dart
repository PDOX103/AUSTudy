import 'package:austudy/Home/studnetclasspage.dart';
import 'package:flutter/material.dart';

class StudentForm extends StatelessWidget {
  final BuildContext context;

  StudentForm(this.context);
  @override
  Widget build(BuildContext context) {
    // Form fields and a submit button for the student
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Enter Your ID',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Enter Name',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Enter Password',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Logic to join class
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>const StudentClassPage(className: 'SD Lab', classCode: 'CSE2100',),
            ));
          },
          child: const Text('Join Class'),
        ),
      ],
    );
  }
}

