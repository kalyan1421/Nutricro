import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String payload;

  SecondScreen(this.payload,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Notification payload:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              payload,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
