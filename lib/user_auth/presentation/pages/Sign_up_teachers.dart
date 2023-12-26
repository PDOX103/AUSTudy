import 'package:austudy_01/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../firebase_auth_implementation/firebase_auth_services.dart';
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
    // TODO: implement dispose
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
        title: Text("Sign Up as Teacher"),
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
                    style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Add any additional fields specific to teachers here
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
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5,),
                      // Updated the code to navigate to a new page for sign-up choice
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _signUp() async{
    String name = _nameController.text;
    String post = _postController.text;
    String department = _departmentController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if(user != null ){
      print("User is successfully created");
      Navigator.pushNamed(context, "/home");
    } else{
      print("Some error happened");
    }

  }
}