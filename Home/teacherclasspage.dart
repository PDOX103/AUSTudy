import 'package:flutter/material.dart';
import '_buildCard.dart';

class TeacherClassPage extends StatelessWidget {
  final String className;
  final String classCode;

  const TeacherClassPage({Key? key, required this.className, required this.classCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$className ($classCode)'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          _buildCard('Live Class', Icons.video_call, context),
          _buildCard('Take Quiz', Icons.question_answer, context),
          _buildCard('Study Material', Icons.book, context),
          _buildCard('Chat', Icons.chat, context),
          _buildCard('Assignment', Icons.assignment, context),
          _buildCard('Notice Board', Icons.notifications, context),
          _buildCard('To Do List', Icons.list, context),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData icon, String label, Widget destinationPage) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => destinationPage));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
/*
class LiveClassPage extends StatelessWidget { /* ... */ }
class TakeQuizPage extends StatelessWidget { /* ... */ }
class StudyMaterialPage extends StatelessWidget { /* ... */ }
class ChatPage extends StatelessWidget { /* ... */ }
class AssignmentPage extends StatelessWidget { /* ... */ }
class NoticeBoardPage extends StatelessWidget { /* ... */ }
class TodoListPage extends StatelessWidget { /* ... */ }

 */