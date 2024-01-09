import 'package:flutter/material.dart';

class LiveClassPage extends StatefulWidget {
  @override
  _LiveClassPageState createState() => _LiveClassPageState();
}

class _LiveClassPageState extends State<LiveClassPage> {
  bool isButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Class'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isButtonVisible = true; // Set the button visibility to true
                });
              },
              child: Text('Live Class'),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: isButtonVisible,
              child: ElevatedButton(
                onPressed: () {
                  // Do something when the new button is pressed
                },
                child: Text('Start Class'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
