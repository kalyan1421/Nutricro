import 'package:flutter/material.dart';

class Goal_page extends StatefulWidget {
  const Goal_page({Key? key}) : super(key: key);

  @override
  State<Goal_page> createState() => _Goal_pageState();
}

class _Goal_pageState extends State<Goal_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("Goal"),)
    );
  }
}
