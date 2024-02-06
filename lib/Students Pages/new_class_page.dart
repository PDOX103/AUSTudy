import 'package:flutter/material.dart';
import 'course_details_page.dart';  // Import the CourseDetailsPage

class NewClassPage extends StatefulWidget {
  @override
  _NewClassPageState createState() => _NewClassPageState();
}

class _NewClassPageState extends State<NewClassPage> {
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _selectedJobTitle;  // Variable to keep track of selected job title

  @override
  void dispose() {
    _courseTitleController.dispose();
    _courseCodeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Navigate to CourseDetailsPage or perform other actions
      // ...
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseDetailsPage(
            courseTitle: _courseTitleController.text,
            courseCode: _courseCodeController.text,
            jobTitle: _selectedJobTitle!,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Class"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _courseTitleController,
                decoration: InputDecoration(labelText: 'Course Title'),
                validator: (value) => value!.isEmpty ? 'Please enter a course title' : null,
              ),
              TextFormField(
                controller: _courseCodeController,
                decoration: InputDecoration(labelText: 'Course Code'),
                validator: (value) => value!.isEmpty ? 'Please enter a course code' : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedJobTitle,
                decoration: InputDecoration(labelText: 'Your Job Title'),
                items: <String>['Lecturer', 'Assistant Professor', 'Associate Professor', 'Professor']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedJobTitle = newValue!;
                  });
                },
                validator: (value) => value == null ? 'Please select a job title' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Create Password'),
                obscureText: true,  // To hide password
                validator: (value) => value!.isEmpty ? 'Please create a password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}