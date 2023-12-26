import 'package:austudy/Home/studentform.dart';
import 'package:austudy/Home/teacherform.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  String? selectedRole;
  final List<String> roles = ['teacher', 'student'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              hint: const Text('Are you a ... ?'),
              value: selectedRole,
              onChanged: (newValue) {
                setState(() {
                  selectedRole = newValue!;
                });
              },
              items: roles.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (selectedRole == 'teacher')
              TeacherForm(context)
            else if (selectedRole == 'student')
              StudentForm(context),
          ],
        ),
      ),
    );
  }
}