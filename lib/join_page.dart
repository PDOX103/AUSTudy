// join_page.dart

import 'package:flutter/material.dart';

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
              // Add any content or instructions here

              // Form with "Enter Your Id" and "Enter Password" fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration:const InputDecoration(
                        labelText: 'Enter Your ID',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true, // To hide the password input
                      decoration:const InputDecoration(
                        labelText: 'Enter Password',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle the "Submit" button press
                            // You can add the logic to validate the inputs
                            // and perform any other action
                          },
                          child:const Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle the "Cancel" button press
                            // You can add the logic to go back or perform any other action
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