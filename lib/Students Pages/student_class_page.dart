// student_class_page.dart

import 'package:flutter/material.dart';

import '../class menu/class_settings_page.dart';
import '../class menu/profile_update.dart';
import '../pages/announcement_page.dart';
import '../pages/assignment_page.dart';
import '../pages/group_details_page.dart';
import '../pages/live_class_page.dart';
import '../pages/quiz_page.dart';
import '../pages/results_page.dart';
import '../pages/study_material_page.dart';

class StudentClassPage extends StatelessWidget {
  final String courseTitle;
  final String courseCode;
  final String jobTitle;
  final String password;

  // Constructor to receive data from the previous page
  const StudentClassPage({
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
            Text(courseTitle, style: TextStyle(fontSize: 20)),
            Text(courseCode, style: TextStyle(fontSize: 16)),
          ],
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.groups, color: Colors.white),
              onPressed: () {
                // Navigate to the GroupDetailsPage when the group icon is pressed
                // You can replace GroupDetailsPage with the appropriate destination
                Navigator.push(context, MaterialPageRoute(builder: (context) => GroupDetailsPage()));
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
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
              leading: const Icon(Icons.person),
              title: const Text('Your Profile'),
              onTap: () {
                // Navigate to Your Profile
                // You can replace ProfileUpdatePage with the appropriate destination
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUpdatePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.class_),
              title: const Text('Classes'),
              onTap: () {
                // Navigate to Classes
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Class Setting'),
              onTap: () {
                // Navigate to Class Setting
                // You can replace ClassSettingsPage with the appropriate destination
                Navigator.push(context, MaterialPageRoute(builder: (context) => ClassSettingsPage()));
              },
            ),
            ListTile(
              title: const Text('Exit'),
              onTap: () {
                // Handle exit logic if needed
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
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

  Widget _buildGridItem(BuildContext context, String title, IconData icon, Widget destinationPage) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destinationPage)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50, color: Colors.green),
            Text(title),
          ],
        ),
      ),
    );
  }
}