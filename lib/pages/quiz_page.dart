import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();
  final TextEditingController _questionNumberController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void dispose() {
    _courseTitleController.dispose();
    _courseCodeController.dispose();
    _questionNumberController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Create Quiz'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding:const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _courseTitleController,
                decoration:const InputDecoration(labelText: 'Course Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the course title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _courseCodeController,
                decoration:const InputDecoration(labelText: 'Course Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the course code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _questionNumberController,
                decoration:const InputDecoration(labelText: 'Number of Questions'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of questions';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _timeController,
                decoration:const InputDecoration(labelText: 'Time (in minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time for the quiz';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process data (e.g., create quiz)
                        // Access the entered values like this:
                        String courseTitle = _courseTitleController.text;
                        String courseCode = _courseCodeController.text;
                        int questionNumber = int.parse(_questionNumberController.text);
                        int time = int.parse(_timeController.text);

                        // Further logic to handle the quiz creation
                      }
                    },
                    child:const Text('Create'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the form
                    },
                    child:const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
