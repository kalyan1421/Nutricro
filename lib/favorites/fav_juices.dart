import 'package:flutter/material.dart';

class Fav_juices extends StatefulWidget {
  const Fav_juices({super.key});

  @override
  State<Fav_juices> createState() => _Fav_juicesState();
}

class _Fav_juicesState extends State<Fav_juices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Favorites Juices")),
    );
  }
}
