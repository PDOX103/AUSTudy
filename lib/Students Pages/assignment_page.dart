import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  bool isUploadMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isUploadMode
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Logic for inserting file
                },
                child: Text('Insert', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isUploadMode = false;
                  });
                },
                child: Text('Cancel', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Assignment Details'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Logic for publishing the assignment
                    },
                    child: Text('Publish', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isUploadMode = true;
                      });
                    },
                    child: Text('Upload', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}