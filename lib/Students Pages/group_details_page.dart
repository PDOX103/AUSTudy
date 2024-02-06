import 'package:flutter/material.dart';

class GroupDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Discussion Group'),
      ),
      body:const Center(
        child: Text('Group for teacher and students'),
      ),
    );
  }
}