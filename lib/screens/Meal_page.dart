import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/session_manager.dart';
import '../pages/Home_page.dart';

class meal_page extends StatefulWidget {
  meal_page({Key? key}) : super(key: key);

  @override
  State<meal_page> createState() => _meal_pageState();
}
final ref1 = FirebaseDatabase.instance.ref("userdetails")..child(SessionController().userId.toString());

class _meal_pageState extends State<meal_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child:
          ListView(
            children: <Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Calender(),
                  Center(child:
                    BMRAmount(),
                  ),
                ],
              )
            ]
            ),
        ),

    );
  }
}

class BMRAmount extends StatelessWidget {
  final ref1 = FirebaseDatabase.instance.ref("userdetails").child(
      SessionController().userId.toString());

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder(
          stream: ref1.onValue,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var stringbmr = snapshot.data.snapshot.value["bmr"];
              String ex = snapshot.data.snapshot.value["ex"];
              double bmr = double.parse(stringbmr);
              if (ex == "Sedentary") {
                double tdee = bmr * 1.2;
                return
                  Column(
                      children: [
                        Text("$tdee", style: TextStyle(fontSize: 25.0),),
                        Text("$bmr", style: TextStyle(fontSize: 25.0),),
                        Text(ex, style: TextStyle(fontSize: 25.0),)
                      ]
                  );
              }
              else if (ex == "Light") {
                double tdee = bmr * 1.375;
                return Center(
                  child: Container(
                    child: Center(child: Text(
                      "$tdee", style: TextStyle(fontSize: 25.0),)),
                  ),
                );
              }
              else if (ex == "Moderately") {
                double tdee = bmr * 1.55;
                return Center(child: Container(
                    child: Text("$tdee", style: TextStyle(fontSize: 25.0),)),
                );
              }
              else if (ex == "very") {
                double tdee = bmr * 1.735;
                return Center(child: Container(
                    child: Text("$tdee", style: TextStyle(fontSize: 25.0),)),
                );
              }
              else {
                double tdee = bmr * 1.9;
                return Center(child: Container(
                    child: Text("$tdee", style: TextStyle(fontSize: 25.0),)),
                );
              }
            }
            else {
              return Text("Loading");
            }
          }
      );
  }
}