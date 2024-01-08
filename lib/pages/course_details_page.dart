import 'package:flutter/material.dart';
import '../class menu/class_settings_page.dart';
import '../class menu/profile_update.dart';
import '../profile/profilepage.dart';
import '../user_auth/presentation/pages/login_page.dart';
import 'live_class_page.dart';
import 'quiz_page.dart';
import 'assignment_page.dart';
import 'announcement_page.dart';
import 'study_material_page.dart';
import 'results_page.dart';

class CourseDetailsPage extends StatelessWidget {
  final String courseTitle;
  final String courseCode;
  final String jobTitle;
  final String password;

  const CourseDetailsPage({
    Key? key,
    required this.courseTitle,
    required this.courseCode,
    required this.jobTitle,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(courseTitle, style:const TextStyle(fontSize: 20)),
            Text(courseCode, style:const TextStyle(fontSize: 16)),
          ],
        ),
        actions: <Widget>[
          Container(
            margin:const EdgeInsets.all(8),
            decoration:const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon:const Icon(Icons.groups, color: Colors.white),
              onPressed: () {
                // Handle messenger icon action
              },
            ),
          ),
        ],
      ),
      drawer:Drawer(
        // Add drawer items (Your profile, Classes, etc.)
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Class Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading:const Icon(Icons.person),
              title:const Text('Your Profile'),
              onTap: () {
                // Navigate to Your Profile
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profilepage()));
              },
            ),
            ListTile(
              leading:const Icon(Icons.class_),
              title:const Text('Classes'),
              onTap: () {
                // Navigate to Classes
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              leading:const Icon(Icons.settings),
              title:const Text('Class Setting'),
              onTap: () {
                // Navigate to Class Setting
                Navigator.push(context, MaterialPageRoute(builder: (context) => ClassSettingsPage()));

              },
            ),
            ListTile(
              title:const Text('Sign Out'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding:const EdgeInsets.all(16),
        childAspectRatio: 3 / 2,
        children: <Widget>[
          _buildGridItem(context, 'Live Class', Icons.live_tv, LiveClassPage()),
          _buildGridItem(context, 'Quiz', Icons.question_answer_outlined, QuizPage()),
          _buildGridItem(context, 'Assignment', Icons.assignment, AssignmentPage()),
          _buildGridItem(context, 'Announcements', Icons.edit_notifications, AnnouncementPage()),
          _buildGridItem(context, 'Study Materials', Icons.book, StudyMaterialPage()),
          _buildGridItem(context, 'Results', Icons.grade_outlined, ResultsPage()),
        ],
      ),
    );
  }

  Widget _buildCard(String title) {
    return Card(
      child: Center(child: Text(title)),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, Widget destinationPage) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destinationPage)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50, color: Colors.green,),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class LiveClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Live Class'),
      ),
      body:const Center(
        child: Text('Content for Live Classes'),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Quiz'),
      ),
      body:const Center(
        child: Text('Content for Quizzes'),
      ),
    );
  }
}

class AssignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Assignment'),
      ),
      body:const Center(
        child: Text('Content for Assignments'),
      ),
    );
  }
}

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Announcement'),
      ),
      body:const Center(
        child: Text('Content for Announcements'),
      ),
    );
  }
}

class StudyMaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Study Materials'),
      ),
      body:const Center(
        child: Text('Content for Study Materials'),
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Results'),
      ),
      body:const Center(
        child: Text('Content for Results'),
      ),
    );
  }
}