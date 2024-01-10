import 'package:diettest2/models/session_manager.dart';
import 'package:firebase_database/firebase_database.dart';


class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

final userdetails = FirebaseDatabase.instance.ref("userdetails").child(SessionController().userId.toString());
