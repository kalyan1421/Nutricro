import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettest2/pages/Profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home_page.dart';
import 'package:intl/intl.dart';

class Workout_page extends StatefulWidget {
  const Workout_page({Key? key}) : super(key: key);

  @override
  State<Workout_page> createState() => _Workout_pageState();
}

class _Workout_pageState extends State<Workout_page> {
  User? user;
  String? uid;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    uid = user?.uid;
    DateTime now = DateTime.now();
    formattedDate = DateFormat('d').format(now);
    formattedDay = DateFormat('E').format(now);
  }

  late String formattedDate;
  late String formattedDay;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            // SizedBox(height: 30),
            // Row(
            //   children: [
            //     SizedBox(width: 15),
            //     profile_pic(),
            //     Expanded(child: SizedBox()),
            //     calories_user_no(),
            //     SizedBox(width: 5),
            //     Image.asset(
            //       "assets/utiles/flash.png",
            //       scale: 20,
            //     ),
            //     SizedBox(width: 20),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 5),
                      Text("Your Daily Activity",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      Text(
                        "Explore",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 40, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  calories_user_no(),
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/utiles/flash.png",
                    scale: 20,
                  ),
                  Container(
                    width: 60,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber.shade300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(formattedDay,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                        Text(
                          formattedDate,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5, top: 10, right: 15),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       usernameworkout(),
            //       Container(
            //         width: 70,
            //         height: 70,
            //         decoration: BoxDecoration(
            //           color: Colors.pink.shade300,
            //           shape: BoxShape.circle,
            //           border: Border.all(
            //             color: Colors.white,
            //             width: 4.0,
            //           ),
            //         ),
            //         child: const Icon(Icons.person_rounded,
            //             size: 40, color: Colors.white),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width,
                height: height / 7,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Colors.pink.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons8-running-shoe-96.png',
                              color: Colors.black,
                              scale: 2.2,
                            ),
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Challenge! 🔥 ",
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("10,000 Steps",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: 80,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/right-three.png',
                                scale: 2.6,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your workout",
                      style: GoogleFonts.abel(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black)),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "view all",
                        style: TextStyle(color: Colors.pink),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    var gender = snapshot.data!["gender"];
                    if (gender == "Male") {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 15.0),
                            //Squats----------------------------------------------------
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/Boy-Squats.webp'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Squats',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('100-150 calories \n15 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                            //Push Up ---------------------------------------------------------
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/Men_Push-up.jpg'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Push-Ups',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('25-50 calories \n15 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                            //Pull ups-----------------------------------------------------
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/Men_Pull-ups.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Pull-Ups',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('50-70 calories \n15 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Men_dead-lift.jpg'), // replace with your asset path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Dead-lift',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('50-100 calories \n10 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                          ],
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 15.0),
                            //Squats----------------------------------------------------
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/Women-Squats.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Squats',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.grey.shade900)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('100-150 calories \n15 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.grey.shade900)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                            //Push Up ---------------------------------------------------------
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Women-Push_ups.jpg'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Push-Ups',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.grey.shade900)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('25-50 calories \n15 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.grey.shade900)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                            //Pull ups-----------------------------------------------------
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/Women-Lunges.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Lunges',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.grey.shade900)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('40-50 calories \n15 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.grey.shade900)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                            Stack(
                              children: [
                                Container(
                                  width: width / 2,
                                  height: height / 3,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Women-Deadlifts.jpg'), // replace with your asset path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Dead-lift',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('50-100 calories \n10 mins',
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15.0),
                          ],
                        ),
                      );
                    }
                  } else {
                    return Text(
                      "Loading",
                      style: GoogleFonts.abel(
                          fontWeight: FontWeight.bold, fontSize: 5),
                    );
                  }
                }),
            const SizedBox(
              height: 25,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    var gender = snapshot.data!["gender"];
                    if (gender == "Male") {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.pink.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Colors.pink[50],
                              elevation: 5.0,
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width / 1.07,
                                    height: height / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Weight Gain",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28,
                                                      color: Colors.black)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text("16 Exercises",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                              Text("45 Minutes",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 70),
                                        Image.asset(
                                          'assets/weigth-gain-Boy.jpeg',
                                          width: 150,
                                          height: 130,
                                        ),
                                        // SizedBox(width: 1,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.pink.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Colors.pink[50],
                              elevation: 5.0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width / 1.07,
                                    height: height / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Yoga",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28,
                                                      color: Colors.black)),
                                              const SizedBox(height: 10),
                                              Text("16 Exercises",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                              Text("52 Minutes",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 80),
                                        Image.asset(
                                          'assets/Men-Yoga-Hero.jpg',
                                          width: 150,
                                          height: 160,
                                        ),
                                        // SizedBox(width: 1,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.pink.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Colors.pink[50],
                              elevation: 5.0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width / 1.07,
                                    height: height / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Full body",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28,
                                                      color: Colors.black)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text("16 Exercises",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                              Text("52 Minutes",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 90),
                                        Image.asset(
                                          'assets/getty_278411d6698c485ab3dd9164d91e134b.jpg',
                                          width: 140,
                                          height: 160,
                                        ),
                                        // SizedBox(width: 1,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.pink.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Colors.pink[50],
                              elevation: 5.0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width / 1.07,
                                    height: height / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Yoga",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28,
                                                      color: Colors.black)),
                                              const SizedBox(height: 10),
                                              Text("16 Exercises",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                              Text("52 Minutes",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 100),
                                        Image.asset(
                                          'assets/yoga_Girl.jpeg',
                                          width: 130,
                                          height: 130,
                                        ),
                                        // SizedBox(width: 1,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.pink.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Colors.pink[50],
                              elevation: 5.0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width / 1.07,
                                    height: height / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Full body",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28,
                                                      color: Colors.black)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text("16 Exercises",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                              Text("52 Minutes",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 100),
                                        Image.asset(
                                          'assets/blond-fitness-woman-is-working-out-on-pictures_csp59606180.webp',
                                          width: 130,
                                          height: 160,
                                        ),
                                        // SizedBox(width: 1,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.pink.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Colors.pink[50],
                              elevation: 5.0,
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width / 1.07,
                                    height: height / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Stretching",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28,
                                                      color: Colors.black)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text("16 Exercises",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                              Text("52 Minutes",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                      color: Colors.black
                                                          .withOpacity(0.5))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 80),
                                        Image.asset(
                                          'assets/Girl-stretching.jpg',
                                          width: 150,
                                          height: 130,
                                        ),
                                        // SizedBox(width: 1,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  } else {
                    return Text(
                      "Loading",
                      style: GoogleFonts.abel(
                          fontWeight: FontWeight.bold, fontSize: 5),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class Exercise {
  final String name;
  final String description;
  final String assets;

  Exercise(
      {required this.name, required this.description, required this.assets});
}

List<Exercise> exercises = [
  Exercise(
    name: 'Push-ups',
    description: 'Build upper body strength and endurance',
    assets: 'assets/icons8-pushups-100.png',
  ),
  Exercise(
    name: 'Squats',
    description: 'Strengthen your legs and glutes',
    assets: 'assets/icons8-squats-100.png',
  ),
  Exercise(
    name: 'Plank',
    description: 'Improve core strength and stability',
    assets: 'assets/icons8-plank-100.png',
  ),
  Exercise(
    name: 'Jumping jacks',
    description: 'Get your heart rate up and improve coordination skdvckVU',
    assets: 'assets/icons8-base-jumping-100.png',
  ),
  Exercise(
    name: 'Burpees',
    description: 'Full-body exercise that improves endurance and strength',
    assets: 'assets/icons8-pushups-100.png',
  ),
  Exercise(
    name: 'Sit-ups',
    description: 'Strengthen your abdominal muscles',
    assets: 'assets/icons8-sit-ups-90.png',
  ),
];

class ExerciseScreen extends StatelessWidget {
  final Exercise exercise;

  ExerciseScreen({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Calender(),
            Image.asset(
              exercise.assets,
              height: 100,
              width: 100,
              // fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              exercise.description,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExerciseScreen(exercise: exercises[index]),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  exercises[index].assets,
                  height: 100,
                  width: 100,
                  // fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercises[index].name,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        exercises[index].description,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}

// class usernameworkout extends StatefulWidget {
//   @override
//   State<usernameworkout> createState() => _usernameworkoutState();
// }

// class _usernameworkoutState extends State<usernameworkout> {
//   User? user;
//   String? uid;

//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser;
//     uid = user?.uid;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('users')
//               .doc(uid)
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (snapshot.hasData && snapshot.data != null) {
//               String name = snapshot.data!["fullName"];
//               String capname = name;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Text(,style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20)),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Hi, $capname",
//                         style: GoogleFonts.abel(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 23,
//                             color: Colors.black),
//                       ),
//                       Text(
//                         "Let's check your activity",
//                         style: GoogleFonts.abel(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 23,
//                             color: Colors.black.withOpacity(0.5)),
//                       )
//                     ],
//                   ),
//                 ],
//               );
//             } else {
//               return const Center(
//                 child: Text("Loading"),
//               );
//             }
//           }),
//     );
//   }
// }

class calories_user_no extends StatefulWidget {
  calories_user_no({Key? key}) : super(key: key);

  @override
  State<calories_user_no> createState() => _calories_user_noState();
}

class _calories_user_noState extends State<calories_user_no> {
  User? user;
  String? uid;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    uid = user?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream:
            FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            var usercalories = snapshot.data!['calories'];
            return Text(
              "$usercalories",
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            );
          } else {
            return const Text("Loading ",
                style: TextStyle(
                    fontSize: 10.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold));
          }
        });
  }
}
