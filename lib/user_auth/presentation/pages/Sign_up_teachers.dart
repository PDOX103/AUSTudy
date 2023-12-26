import 'package:austudy_01/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:austudy_01/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_page.dart';
import 'login_page.dart';

class SignUpTeachersPage extends StatefulWidget {
  const SignUpTeachersPage({Key? key}) : super(key: key);

  @override
  State<SignUpTeachersPage> createState() => _SignUpTeachersPageState();
}

class _SignUpTeachersPageState extends State<SignUpTeachersPage> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _postController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                        fontWeight: FontWeight.bold),
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
                    onTap: _signUp,
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
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
                      _signInWithGoogle();

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
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print("User is successfully created: ${user.email}");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
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
      print("Error during sign up: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error during sign up. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        User? user = await _auth.signInWithGoogle(credential);

        if (user != null) {
          print("Successfully signed in with Google: ${user.email}");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          print("Google Sign-In failed: User is null");
          // Handle Google Sign-In failure if needed
        }
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      // Handle Google Sign-In error if needed
    }
  }
}
