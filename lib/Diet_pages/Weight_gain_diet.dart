import 'package:flutter/material.dart';

class Weight_gain_diet extends StatefulWidget {
  const Weight_gain_diet({Key? key}) : super(key: key);

  @override
  State<Weight_gain_diet> createState() => _Weight_gain_dietState();
}

class _Weight_gain_dietState extends State<Weight_gain_diet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("Weight_gain_diet DIET PROGRESS" , style: TextStyle(fontSize: 45.0),),
      ),
    );
  }
}
