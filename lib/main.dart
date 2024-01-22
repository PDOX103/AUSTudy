// main.dart

import 'package:flutter/material.dart';
import 'package:project_sd2/pages/new_class_page.dart';
import 'join_page.dart'; // Import the JoinPage class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUSTudy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AUSTudy'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              // Navigate to the JoinPage when the "Join" button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JoinPage()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to AUSTudy'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: const Text('Your Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Exit'),
              onTap: () {
                // Exit the app
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewClassPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

