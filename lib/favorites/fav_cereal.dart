import 'package:flutter/material.dart';

class Fav_cereal extends StatefulWidget {
  const Fav_cereal({super.key});

  @override
  State<Fav_cereal> createState() => _Fav_cerealState();
}

class _Fav_cerealState extends State<Fav_cereal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Fav cerael")),
    );
  }
}
