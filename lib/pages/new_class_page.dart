import 'package:flutter/material.dart';
import 'course_details_page.dart';

class NewClassPage extends StatefulWidget {
  @override
  _NewClassPageState createState() => _NewClassPageState();
}

class _NewClassPageState extends State<NewClassPage> {
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _courseTitleController.dispose();
    _courseCodeController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseDetailsPage(
            courseTitle: _courseTitleController.text,
            courseCode: _courseCodeController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Create New Class',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _courseTitleController,
                decoration: InputDecoration(
                  labelText: 'Course Title',
                  labelStyle: TextStyle(color: Colors.white), // Set label text color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set border color when the field is not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set border color when the field is focused
                  ),
                ),
                style: TextStyle(color: Colors.white), // Set text color
                validator: (value) =>
                value!.isEmpty ? 'Please enter a course title' : null,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _courseCodeController,
                decoration: InputDecoration(
                  labelText: 'Course Code',
                  labelStyle: TextStyle(color: Colors.white), // Set label text color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set border color when the field is not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set border color when the field is focused
                  ),
                ),
                style: TextStyle(color: Colors.white), // Set text color
                validator: (value) =>
                value!.isEmpty ? 'Please enter a course code' : null,
              ),

              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(elevation: 2.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
