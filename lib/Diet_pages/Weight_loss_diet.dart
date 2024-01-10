import 'package:flutter/material.dart';

class Weight_loss_diet extends StatefulWidget {
  const Weight_loss_diet({Key? key}) : super(key: key);

  @override
  State<Weight_loss_diet> createState() => _Weight_loss_dietState();
}

class _Weight_loss_dietState extends State<Weight_loss_diet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: const Text("Weight_loss_diet DIET PROGRESS" , style: TextStyle(fontSize: 45.0),),
          ),
        ]
      ),
    );
  }
}
