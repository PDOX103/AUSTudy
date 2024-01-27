import 'dart:developer';

import 'package:austudy_01/Chat/models/chat_user.dart';
import 'package:austudy_01/Chat/widgets/chat_user_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'api/apis.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ProfileScreen> {

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Profile Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),



      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            child: Column(
              children: [
                SizedBox(width: mq.width, height: mq.height * .03),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(mq.height * .3),
                      child: CachedNetworkImage(
                        width: mq.height * .2,
                        height: mq.height * .2,
                        fit: BoxFit.fill,
                        imageUrl: widget.user.image,
                        errorWidget: (context, url, error) =>
                        const CircleAvatar(child: Icon(CupertinoIcons.person)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: MaterialButton(
                          onPressed: (){},
                          shape: const CircleBorder(),
                      color: Colors.white,
                      child: Icon(Icons.edit)),
                    )
                  ],
                ),
                SizedBox(height: mq.height * .03),

                Text(
                  widget.user.email,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),

                SizedBox(height: mq.height * .05),
                TextFormField(
                  initialValue: widget.user.name,
                  onSaved: (val)=> APIs.user.name = val ?? '',
                  validator: (val)=> val!= null && val.isNotEmpty ? null : 'Required Filled',
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'eg. Fahmidul',
                      label: Text('Name')),
                ),
                SizedBox(height: mq.height * .03),
                TextFormField(
                  onSaved: (val)=> APIs.user.about = val ?? '',
                  validator: (val)=> val!= null && val.isNotEmpty ? null : 'Required Filled',
                  initialValue: widget.user.about,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.info_outline, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'eg. Feeling Happy',
                      label: Text('About')),
                ),

                SizedBox(height: mq.height * .05),

                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(),
                        minimumSize: Size(mq.width * .43, mq.height * .056)),
                    onPressed: () {
                      if(_formkey.currentState!.validate()){
                        _formkey.currentState!.save();
                        APIs.updateUserInfo();
                      }
                    },
                    icon: const Icon(Icons.edit, size: 22),
                    label: const Text('Update', style: TextStyle(fontSize: 17),)
                ),
                SizedBox(height: 20), // Add additional spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}