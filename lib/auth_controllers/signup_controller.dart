

import 'package:diettest2/auth_controllers/UI/User_Details_1.dart';
import 'package:diettest2/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class SignUpController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final CollectionReference _usersCollection =
//       FirebaseFirestore.instance.collection('users');

//   Future<void> signup(BuildContext context, String username, String email,
//       String password) async {
//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       await _usersCollection.doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'email': userCredential.user!.email,
//         'fullName': username,
//       });

//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => User_Details_1()),
//       );
//     } catch (error) {
//       print(error.toString());
//       showToast("try angain");
//     }
//   }
// }

import 'dart:io';

class SignUpController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> signup(BuildContext context, String username, String email,
      String password, File profileImage) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String imagePath = 'profile_images/${userCredential.user!.uid}.png';
      UploadTask uploadTask = _storage.ref().child(imagePath).putFile(profileImage);
      TaskSnapshot snapshot = await uploadTask;

      String imageUrl = await snapshot.ref.getDownloadURL();

      await _usersCollection.doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'fullName': username,
        'profileImageUrl': imageUrl,
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => User_Details_1()),
      );
    } catch (error) {
      print(error.toString());
      showToast("Try again");
    }
  }
}
