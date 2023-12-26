import 'package:flutter/material.dart';

class ClassCreatorPage extends StatefulWidget {
  const ClassCreatorPage({Key? key}) : super(key: key);

  @override
  _ClassCreatorPageState createState() => _ClassCreatorPageState();
}

class _ClassCreatorPageState extends State<ClassCreatorPage> {
  String? _userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Role'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200, // Light shade of white or any color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: DropdownButton<String>(
                value: _userType,
                hint: const Text('Are you a...'),
                items: <String>['Teacher', 'Student']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _userType = newValue;
                  });
                },
                underline: Container(), // Remove underline
              ),
            ),
            SizedBox(height: 20), // Spacing
            ElevatedButton(
              onPressed: () => _navigateBasedOnSelection(context),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateBasedOnSelection(BuildContext context) {
    if (_userType == 'Teacher') {
      // Navigate to Create Class Page
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateClassPage()));
    } else if (_userType == 'Student') {
      // Navigate to Join Class Page
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JoinClassPage()));
    } else {
      // Handle case where no option is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a role')),
      );
    }
  }
}

class CreateClassPage extends StatelessWidget {
  const CreateClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Class'),
      ),
      // Add content for Create Class Page
    );
  }
}

class JoinClassPage extends StatelessWidget {
  const JoinClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Class'),
      ),
      // Add content for Join Class Page
    );
  }
}