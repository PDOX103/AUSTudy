import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Add user data to Firestore
      await _storeUserData(credential.user!.uid, email);

      return credential.user;
    } catch (e) {
      print("Some error occurred");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occurred");
    }
    return null;
  }

  // Future<User?> signInWithGoogle(AuthCredential credential) async {
  //   try {
  //     UserCredential authResult = await _auth.signInWithCredential(credential);
  //
  //     // Add user data to Firestore
  //     await _storeUserData(authResult.user!.uid, authResult.user!.email);
  //
  //     return authResult.user;
  //   } catch (e) {
  //     print("Some error occurred $e");
  //   }
  //   return null;
  // }

  Future<void> _storeUserData(String userId, String email) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'email': email,
        // Add more fields as needed
      });
    } catch (e) {
      print("Error storing user data: $e");
    }
  }
}
