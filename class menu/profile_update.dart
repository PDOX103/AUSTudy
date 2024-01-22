import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatefulWidget {
  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedJobTitle = 'lecturer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Your Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Update your name'),
            ),
            DropdownButton<String>(
              value: _selectedJobTitle,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedJobTitle = newValue!;
                });
              },
              items: <String>['lecturer', 'assistant professor', 'associate professor', 'professor']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Update password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle update logic
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}