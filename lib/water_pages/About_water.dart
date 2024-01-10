import 'package:flutter/material.dart';

class About_Water extends StatefulWidget {
  const About_Water({Key? key}) : super(key: key);

  @override
  State<About_Water> createState() => _About_WaterState();
}

class _About_WaterState extends State<About_Water> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("About Water PAGE"),)
    );
  }
}
