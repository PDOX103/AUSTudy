import 'package:austudy_01/user_auth/presentation/pages/sign_up_page.dart';
import 'package:austudy_01/user_auth/presentation/pages/Sign_up_teachers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpChoicePage extends StatelessWidget {
  const SignUpChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Choice"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose Your Role",
                style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text("Student"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpTeachersPage()));
                },
                child: Text("Teacher"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
