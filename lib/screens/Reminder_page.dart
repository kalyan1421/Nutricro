import 'package:flutter/material.dart';

class Reminder_page extends StatefulWidget {
  const Reminder_page({Key? key}) : super(key: key);

  @override
  State<Reminder_page> createState() => _Reminder_pageState();
}

class _Reminder_pageState extends State<Reminder_page> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: const Text("Reminder Page"),),
    );
  }
}
