import 'package:austudy_01/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:austudy_01/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../pages/new_class_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class SignUpTeachersPage extends StatefulWidget {
  const SignUpTeachersPage({Key? key}) : super(key: key);

  @override
  State<SignUpTeachersPage> createState() => _SignUpTeachersPageState();
}

class _SignUpTeachersPageState extends State<SignUpTeachersPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _postController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _postController.dispose();
    _departmentController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Teacher Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FormContainerWidget(
                    controller: _nameController,
                    hintText: "Name",
                    isPasswordField: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: _postController,
                    hintText: "Post",
                    isPasswordField: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: _departmentController,
                    hintText: "Department",
                    isPasswordField: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: _emailController,
                    hintText: "AUST Edu-Mail",
                    isPasswordField: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: _passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: _isLoading ? null : _signUp,
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                        )
                            : Text(
                          "Sign Up as Teacher",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      //_signInWithGoogle();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.google, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text(
                              "Sign in with Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String name = _nameController.text;
    String post = _postController.text;
    String department = _departmentController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      setState(() {
        _isLoading = true;
      });

      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      setState(() {
        _isLoading = false;
      });

      if (user != null) {
        print("User is successfully created: ${user.email}");

        await _storeTeacherData(user.uid, name, post, department, email);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NewClassPage()));
      } else {
        print("User creation failed: User is null");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Account creation failed. Please try again."),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      print("Error during sign up: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error during sign up. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _storeTeacherData(String userId, String name, String post,
      String department, String email) async {
    try {
      await _firestore.collection('teachers').doc(userId).set({
        'name': name,
        'post': post,
        'department': department,
        'email': email,
        // Add more fields as needed
      });
    } catch (e) {
      print("Error storing teacher data: $e");
    }
  }
}
