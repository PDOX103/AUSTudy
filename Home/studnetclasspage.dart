import 'package:flutter/material.dart';

class StudentClassPage extends StatelessWidget {
  final String className;
  final String classCode;

  const StudentClassPage({Key? key, required this.className, required this.classCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$className ($classCode)'),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(context, Icons.videocam, "Join Class", Placeholder()), // Temporary placeholder
          _buildListItem(context, Icons.quiz, "Attend Quiz", Placeholder()), // Temporary placeholder
          _buildListItem(context, Icons.assignment, "Assignment", Placeholder()), // Temporary placeholder
          _buildListItem(context, Icons.announcement, "Notice Board", Placeholder()), // Temporary placeholder
          _buildListItem(context, Icons.book, "Study Material", Placeholder()), // Temporary placeholder
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, IconData icon, String label, Widget destinationPage) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => destinationPage));
      },
    );
  }
}

// Placeholder widget
class Placeholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Placeholder Page"),
      ),
      body:const Center(
        child: Text("This is a placeholder page."),
      ),
    );
  }
}
