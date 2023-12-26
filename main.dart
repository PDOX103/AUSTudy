import 'package:flutter/material.dart';

import 'Create Class/create_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUSTudy',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _navigateToNewPage(BuildContext context) {

    ///Add icon e click krle jei page ashbe
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewPage()));

    ///create new class
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ClassCreatorPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text('AUSTudy'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'AUSTudy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            ListTile(
              leading:const Icon(Icons.home),
              title:const Text('Homepage'),
              onTap: () {
                // Handle Homepage tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            Spacer(), // Pushes the exit to the bottom
            ListTile(
              leading:const Icon(Icons.exit_to_app),
              title:const Text('Exit'),
              onTap: () {
                // Handle Exit tap
                Navigator.pop(context); // Close the drawer
                // Exit the app or navigate to another screen
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to AUSTudy!',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Create',
        child: FloatingActionButton(
          onPressed: () => _navigateToNewPage(context),
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),


    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Class'),
      ),
      body: const Center(
        child: Text('This is a new page!'),
      ),
    );
  }
}

