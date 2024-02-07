import 'dart:developer';

import 'package:austudy_01/Chat/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static get user => auth.currentUser!;
// for checking if user exists or not?
  static Future<bool> userExists() async {
    return (await firestore
        .collection('teachers')
        .doc(auth.currentUser!.uid)
        .get())
        .exists;
  }

  // for creating a new user
  static Future<void> creatUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(
        image: user.photoUrl.toString(),
        about: "Hey! I'm Using AUSTudy Chat",
        name: auth.currentUser!.displayName.toString(),
        createdAt: time,
        isOnline: false,
        id: user.uid,
        lastActive: time,
        email: user.email.toString(),
        pushToken: '');
    return await firestore
        .collection('teachers')
        .doc(auth.currentUser!.uid)
        .set(chatUser.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(){
    return firestore.collection('teachers')
         // Exclude current user
        .snapshots();
  }

  // Add a method to get user by email
  static Future<ChatUser?> getUserByEmail(String email) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('teachers')
        .where('email', isEqualTo: email)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return ChatUser.fromJson(snapshot.docs.first.data());
    } else {
      return null;
    }
  }

  static Future<void> updateUserInfo() async {
     await firestore
        .collection('teachers')
        .doc(auth.currentUser!.uid)
        .update({
       'name': user.name,
       'about': user.about
        });
  }


}


