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
          _buildListItem(context, Icons.videocam, "Join Class",// JoinClassPage()),
          _buildListItem(context, Icons.quiz, "Attend Quiz", //AttendQuizPage()),
          _buildListItem(context, Icons.assignment, "Assignment",// StudentAssignmentPage()),
          _buildListItem(context, Icons.announcement, "Notice Board", //StudentNoticeBoardPage()),
          _buildListItem(context, Icons.book,"Study Material"// StudentStudyMaterialPage()),
          )
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
/*
// Placeholder pages for each feature
class JoinClassPage extends StatelessWidget { /* ... */ }
class AttendQuizPage extends StatelessWidget { /* ... */ }
class StudentAssignmentPage extends StatelessWidget { /* ... */ }
class StudentNoticeBoardPage extends StatelessWidget { /* ... */ }
class StudentStudyMaterialPage extends StatelessWidget { /* ... */ }

 */