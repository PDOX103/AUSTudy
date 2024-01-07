import 'package:flutter/material.dart';

class ClassSettingsPage extends StatelessWidget {
  final _classTitleController = TextEditingController();
  final _classCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _classTitleController,
              decoration: InputDecoration(labelText: 'Update class title'),
            ),
            TextField(
              controller: _classCodeController,
              decoration: InputDecoration(labelText: 'Update class code'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle update logic
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}