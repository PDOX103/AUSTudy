// join_page.dart

import 'package:flutter/material.dart';
import 'student_class_page.dart'; // Import the StudentClassPage class

class JoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Join Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Form with "Enter Your Id" and "Enter Password" fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration:const InputDecoration(
                        labelText: 'Enter Your Id',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true, // To hide the password input
                      decoration:const InputDecoration(
                        labelText: 'Enter Password',
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle the "Submit" button press
                            // You can add the logic to validate the inputs
                            // and navigate to the StudentClassPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>const StudentClassPage(
                                  courseTitle: 'Sample Course Title', // Replace with actual data
                                  courseCode: 'Sample Course Code', // Replace with actual data
                                  jobTitle: 'Sample Job Title', // Replace with actual data
                                  password: 'Sample Password', // Replace with actual data
                                ),
                              ),
                            );
                          },
                          child:const Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle the "Cancel" button press
                            // You can add the logic to go back or navigate to the main.dart page
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                          },
                          child:const Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}