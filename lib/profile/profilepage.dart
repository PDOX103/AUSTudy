import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  late TextEditingController _nameController;
  late TextEditingController _departmentController;
  late TextEditingController _postController;

  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("teachers");

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _departmentController = TextEditingController(text: "");
    _postController = TextEditingController(text: "");
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection("teachers")
          .doc(currentUser.uid) // Use currentUser.uid instead of currentUser.email
          .get();

      if (userSnapshot.exists) {
        setState(() {
          _nameController.text = userSnapshot.get('name') ?? "";
          _departmentController.text = userSnapshot.get('department') ?? "";
          _postController.text = userSnapshot.get('post') ?? "";
        });
      }
    }
  }

  Future<void> editField(String field) async {
    late String fieldName;
    late TextEditingController controller;

    if (field == 'name') {
      fieldName = 'Name';
      controller = _nameController;
    } else if (field == 'department') {
      fieldName = 'Department';
      controller = _departmentController;
    } else if (field == 'post') {
      fieldName = 'Post';
      controller = _postController;
    } else {
      return;
    }

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Edit $fieldName',
          style: TextStyle(color: Colors.black),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Enter new $fieldName',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                try {
                  await userCollection
                      .doc(currentUser.uid)
                      .update({field: controller.text});
                  setState(() {
                    if (field == 'name') {
                      _nameController.text = controller.text;
                    } else if (field == 'department') {
                      _departmentController.text = controller.text;
                    } else if (field == 'post') {
                      _postController.text = controller.text;
                    }
                  });
                  print('Updated $field to: ${controller.text}');
                  Navigator.of(context).pop();
                } catch (e) {
                  print("Error updating $field: $e");
                }
              } else {
                print('Value cannot be empty');
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade200,
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Signed in as:",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purple[500],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 10,),
          TextBox(
            text: _nameController.text,
            sectionName: 'Name',
            onPressed: () => editField('name'),
          ),
          TextBox(
            text: _departmentController.text,
            sectionName: 'Department',
            onPressed: () => editField('department'),
          ),
          TextBox(
            text: _postController.text,
            sectionName: 'Post',
            onPressed: () => editField('post'),
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;

  const TextBox({
    Key? key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: TextStyle(color: Colors.white70),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
