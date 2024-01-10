import 'package:flutter/material.dart';

class Track_workout extends StatefulWidget {
  const Track_workout({Key? key}) : super(key: key);

  @override
  State<Track_workout> createState() => _Track_workoutState();
}

class _Track_workoutState extends State<Track_workout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text("Track Workout"),
        )
    );
  }
}
