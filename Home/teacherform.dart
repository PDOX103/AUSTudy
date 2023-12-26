import 'package:austudy/Home/teacherclasspage.dart';
import 'package:flutter/material.dart';

class TeacherForm extends StatelessWidget {
  final BuildContext context;

  TeacherForm(this.context);
  @override
  Widget build(BuildContext context) {
    // Form fields and a submit button for the teacher
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Enter Class Name',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Enter Class Code',
          ),
        ),
        DropdownButtonFormField<String>(
          hint: const Text('Select Section'),
          items: ['A', 'B', 'C'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Join Password',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Logic to create class
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TeacherClassPage(
                className: 'Example Class',
                classCode: '123ABC',
              ),
            ));
          },
          child: const Text('Create Class'),
        ),
      ],
    );
  }
}