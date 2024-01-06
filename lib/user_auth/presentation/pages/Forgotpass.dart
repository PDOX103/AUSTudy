import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot_pass extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  var Email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forgot Password',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 25, color: Colors.black),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/pass.jpeg"), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter that email you have logged in before',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: (320 / 350) * screenW,
                  child: TextField(
                    controller: Email,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.white10,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.white60,
                          )),
                      hintText: "Enter email.......",
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(0, (150 / 872) * screenH),
              ),
              GestureDetector(
                onTap: () {
                  var e = Email.text;
                  auth
                      .sendPasswordResetEmail(email: Email.text.toString())
                      .then((value) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Expanded(
                            child: AlertDialog(
                              title: Text("Successfully sent you a link at your email $e", style: TextStyle(color: Colors.white,fontSize: 15)),
                            ),
                          );
                        });
                  }).onError((error, stackTrace) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Expanded(
                              child: AlertDialog(
                                title: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                content: Text("An error occured!"),
                              ));
                        });
                  });
                },
                child: Container(
                    width: (180 / 392) * screenW,
                    height: (60 / 872) * screenH,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.greenAccent,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 4,
                          color: Colors.black26,
                          offset: Offset(0, (7 / 872.72) * screenH),
                        )
                      ],
                    ),
                    child: Center(
                        child: Text(
                          "Send Link",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              color: Colors.black),
                        ))),
              ),
            ],
          ),
        ));
  }
}
