import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Question Numbers'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Set Mark Distribution for per question'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Set Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic for creating quiz goes here
              },
              child: Text('Create Quiz', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}