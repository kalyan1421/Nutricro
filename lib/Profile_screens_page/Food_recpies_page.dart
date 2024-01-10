import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Food_recpies extends StatefulWidget {
  const Food_recpies({Key? key}) : super(key: key);

  @override
  State<Food_recpies> createState() => _Food_recpiesState();
}

class _Food_recpiesState extends State<Food_recpies> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
            backgroundColor: Colors.blueGrey[50],
            appBar:
            AppBar(
                toolbarHeight: 50, centerTitle: true, elevation: 1,
                title: Text("Food Recpies", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white) ,),
                backgroundColor: Colors.pink[300]),
            body: Center(child: Text("dfkvj"),)
        ),
      ],
    );
  }
}
