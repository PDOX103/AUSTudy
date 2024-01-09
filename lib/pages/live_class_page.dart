import 'package:flutter/material.dart';

class LiveClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Class'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic to start the class goes here
          },
          child: Text(
            'Start Class',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),
    );
  }
}
