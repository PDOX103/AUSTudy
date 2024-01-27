import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Announcement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration:const InputDecoration(
                labelText: 'Write Announcement',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement logic for publishing the announcement
                  },
                  child:const Text('Publish'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the page on cancel
                  },
                  child:const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
