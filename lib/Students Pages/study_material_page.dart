import 'package:flutter/material.dart';

class StudyMaterialPage extends StatefulWidget {
  @override
  _StudyMaterialPageState createState() => _StudyMaterialPageState();
}

class _StudyMaterialPageState extends State<StudyMaterialPage> {
  bool isUploadMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Materials'),
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
                decoration: InputDecoration(labelText: 'Enter Material Details'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Logic for publishing the study material
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