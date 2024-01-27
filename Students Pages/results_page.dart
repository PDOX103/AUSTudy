import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  bool isPublishClicked = false;
  bool isInsertClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: isPublishClicked
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic for inserting results
                    setState(() {
                      isInsertClicked = true;
                    });
                  },
                  child: Text('Insert', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPublishClicked = false;
                    });
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              ],
            ),
          ],
        )
            : isInsertClicked
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Logic for publishing results
              },
              child: Text('Publish', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isInsertClicked = false;
                });
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        )
            : ElevatedButton(
          onPressed: () {
            setState(() {
              isPublishClicked = true;
            });
          },
          child: Text('Publish', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ),
      ),
    );
  }
}