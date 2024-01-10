// import 'package:firebase_auth/firebase_auth.dart';
// import 'onAuthStateChanged';
// class AuthService{
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Stream<String> get onAuthStateChanged =>
//       _auth.onAuthStateChanged.map(
//           (FirebaseUser user) => user?.uid,
//       );
//
//   Future<String> createUserWithEmailAndPassword(String emai)
//
//   Future<String> getCurrentUID() async {
//     return (await _auth.currentUser!).uid;
//   }
//   signOut() {
//     return _auth.signOut();
//   }
// }
 import 'package:diettest2/auth_controllers/UI/loginscreen.dart';
import 'package:diettest2/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

User? user;

  UserModel? userModel;
  DatabaseReference? userRef;
  final auth = FirebaseAuth.instance;
    Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } catch (e) {
      print("Error logging out: $e");
    }
  }
