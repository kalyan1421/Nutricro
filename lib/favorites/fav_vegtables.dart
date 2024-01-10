import 'package:flutter/material.dart';

class Fav_vegtables extends StatefulWidget {
  const Fav_vegtables({super.key});

  @override
  State<Fav_vegtables> createState() => _Fav_vegtablesState();
}

class _Fav_vegtablesState extends State<Fav_vegtables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Favorites vegtables")),
    );
  }
}
