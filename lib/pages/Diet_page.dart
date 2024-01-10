import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettest2/Diet_pages/Pregnancy.dart';
import 'package:diettest2/Diet_pages/none.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Diet_pages/Diabetes_1.dart';
import '../Diet_pages/Diabetes_2.dart';
import '../Diet_pages/Pcoddiet.dart';
import '../Profile_screens_page/Health_blogs.dart';
import '../models/theme.dart';

class diet_page extends StatefulWidget {
  const diet_page({Key? key}) : super(key: key);
  @override
  _diet_pageState createState() => _diet_pageState();
}

class _diet_pageState extends State<diet_page> {
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Container(
              width: width / 2,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: ShapeDecoration(
                            color: Colors.transparent,
                            shape: CircleBorder(
                                side: BorderSide(
                                    width: 4,
                                    color: Colors.blueGrey.shade200))),
                        child: Image.asset(
                          "assets/icons8-restaurant-64.png",
                          color: Colors.pinkAccent,
                          scale: 1.5,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Eat up to ",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.normal)),
                      calories_user(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  bmi()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: <Widget>[
              const SizedBox(
                width: 6.0,
              ),
              Container(
                width: width / 2.6,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/icons8-rice-bowl-100.png",
                        color: Colors.black,
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Recipes",
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                width: width / 2.5,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons8-fire-90.png",
                        color: Colors.black,
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Edit Calories",
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                width: width / 2.6,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons8-bowl-with-spoon-100.png",
                        color: Colors.black,
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Saved Meals",
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                width: width / 2.6,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/alarm.png",
                        color: Colors.black,
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Food Reminder",
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
            ]),
          ),
          const SizedBox(
            height: 8.0,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  var condition = snapshot.data?['condition'];
                  var specondition = snapshot.data?['Specifcondition'];
                  if (condition == "PCOD" ||
                      condition == "Diabetes Type 1" ||
                      condition == "Diabetes Type 2" ||
                      condition == "None" ||
                      condition == "Cholesterol") {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Container(
                        width: width / 2,
                        height: width / 2,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 6),
                              child: Text("Macros Ratio",
                                  style: GoogleFonts.abel(
                                      fontSize: 20,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Calories",
                                        style: GoogleFonts.abel(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: width / 1.85,
                                      ),
                                      StreamBuilder<DocumentSnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(uid)
                                              .snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<DocumentSnapshot>
                                                  snapshot) {
                                            if (snapshot.hasData &&
                                                snapshot.data != null) {
                                              var usercalories =
                                                  snapshot.data!['calories'];
                                              return Text(
                                                "$usercalories Cal",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color:
                                                        Colors.grey.shade800),
                                              );
                                            } else {
                                              return const Text("Loading",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold));
                                            }
                                          }),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    height: 10,
                                    width: width / 1.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Health_blog()));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      Text(
                                        "Cards",
                                        style: GoogleFonts.abel(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 2),
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 10,
                                            width: width / 5,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: Colors.black12,
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                            width: width / 8,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: Colors.orangeAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(uid)
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                var calories =
                                                    snapshot.data!['calories'];
                                                double cards =
                                                    (calories * 0.65) / 4;
                                                return Text(
                                                  "${cards.round()}g | 50%",
                                                );
                                              }
                                              return const Text("Loading");
                                            },
                                          )
                                        ],
                                      ),
                                    ]),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(children: [
                                      Text(
                                        "Fat",
                                        style: GoogleFonts.abel(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Stack(
                                            children: <Widget>[
                                              Container(
                                                height: 10,
                                                width: width / 5,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.black12,
                                                ),
                                              ),
                                              Container(
                                                height: 10,
                                                width: width / 11,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.purple,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(uid)
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                var calories =
                                                    snapshot.data!['calories'];
                                                double fat =
                                                    (calories * 0.25) / 4;
                                                return Text(
                                                  "${fat.round()}g | 30%",
                                                );
                                              }
                                              return const Text("Loading");
                                            },
                                          )
                                        ],
                                      ),
                                    ]),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(children: [
                                      Text(
                                        "Protein",
                                        style: GoogleFonts.abel(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Stack(
                                            children: <Widget>[
                                              Container(
                                                height: 10,
                                                width: width / 5,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.black12,
                                                ),
                                              ),
                                              Container(
                                                height: 10,
                                                width: width / 18,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.pink.shade300,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(uid)
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                var calories =
                                                    snapshot.data!['calories'];
                                                double protein =
                                                    (calories * 0.15) / 4;
                                                return Text(
                                                  "${protein.round()}g | 20%",
                                                );
                                              }
                                              return const Text("Loading");
                                            },
                                          )
                                        ],
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (condition == "Pregnancy") {
                    if (specondition == "1-12 weeks") {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Container(
                          width: width / 2,
                          height: width / 1.7,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 6),
                                child: Text("Macros Ratio",
                                    style: GoogleFonts.abel(
                                        fontSize: 20,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, right: 10, left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "Calories",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: width / 1.85,
                                        ),
                                        StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(uid)
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (snapshot.hasData &&
                                                  snapshot.data != null) {
                                                var usercalories =
                                                    snapshot.data!['calories'];
                                                return Text(
                                                  "$usercalories Cal",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                      color:
                                                          Colors.grey.shade800),
                                                );
                                              } else {
                                                return const Text("Loading",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold));
                                              }
                                            }),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height: 10,
                                      width: width / 1.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Health_blog()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        Text(
                                          "Cards",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 10,
                                              width: width / 5,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.black12,
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                              width: width / 8,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.orangeAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var calories = snapshot
                                                      .data!['calories'];
                                                  double cards =
                                                      ((calories * 0.44) / 4);
                                                  return Text(
                                                    "${cards.round()}g | 44%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(children: [
                                        Text(
                                          "Fat",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 10,
                                                  width: width / 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: width / 11,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.purple,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                {
                                                  if (snapshot.hasData) {
                                                    var calories = snapshot
                                                        .data!['calories'];
                                                    double fat =
                                                        (calories * 0.30) / 4;
                                                    return Text(
                                                      "${fat.round()}g | 30%",
                                                    );
                                                  }
                                                  return const Text("Loading");
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(children: [
                                        Text(
                                          "Protein",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 10,
                                                  width: width / 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: width / 18,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.pink.shade300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 5),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var calories = snapshot
                                                      .data!['calories'];
                                                  double protein =
                                                      (calories * 0.26) / 4;
                                                  return Text(
                                                    "${protein.round()}g | 26%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-important-event-50.png",
                                      scale: 2,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "Note:   As you are in 1st Trimester \nthere is no extra calories required",
                                        style: GoogleFonts.catamaran(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else if (specondition == "13-26 weeks") {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Container(
                          width: width / 2,
                          height: width / 1.7,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 6),
                                child: Text("Macros Ratio",
                                    style: GoogleFonts.abel(
                                        fontSize: 20,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, right: 10, left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "Calories",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: width / 1.85,
                                        ),
                                        StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(uid)
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (snapshot.hasData &&
                                                  snapshot.data != null) {
                                                var cal =
                                                    snapshot.data!['calories'];
                                                var usercalories = cal + 300;
                                                return Text(
                                                  "$usercalories Cal",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 47, 37, 37)),
                                                );
                                              } else {
                                                return const Text("Loading",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold));
                                              }
                                            }),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height: 10,
                                      width: width / 1.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Health_blog()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        Text(
                                          "Cards",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 10,
                                              width: width / 5,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.black12,
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                              width: width / 8,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.orangeAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var cal = snapshot
                                                      .data!['calories'];
                                                  var calories = cal + 300;
                                                  double cards =
                                                      ((calories * 0.44) / 4);
                                                  return Text(
                                                    "${cards.round()}g | 44%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(children: [
                                        Text(
                                          "Fat",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 10,
                                                  width: width / 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: width / 11,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.purple,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var cal = snapshot
                                                      .data!['calories'];
                                                  var calories = cal + 300;
                                                  double fat =
                                                      (calories * 0.30) / 4;
                                                  return Text(
                                                    "${fat.round()}g | 30%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(children: [
                                        Text(
                                          "Protein",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 10,
                                                  width: width / 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: width / 18,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.pink.shade300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 5),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var cal = snapshot
                                                      .data!['calories'];
                                                  var calories = cal + 300;
                                                  double protein =
                                                      (calories * 0.26) / 4;
                                                  return Text(
                                                    "${protein.round()}g | 26%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-important-event-50.png",
                                      scale: 2,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "Note:   As you are in 2nd Trimester \n300 extra calories required",
                                        style: GoogleFonts.catamaran(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else if (specondition == "27-40 weeks") {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Container(
                          width: width / 2,
                          height: width / 1.7,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 6),
                                child: Text("Macros Ratio",
                                    style: GoogleFonts.abel(
                                        fontSize: 20,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, right: 10, left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "Calories",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: width / 1.85,
                                        ),
                                        StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(uid)
                                                .snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<DocumentSnapshot>
                                                    snapshot) {
                                              if (snapshot.hasData &&
                                                  snapshot.data != null) {
                                                var cal =
                                                    snapshot.data!['calories'];
                                                var usercalories = cal + 400;
                                                return Text(
                                                  "$usercalories Cal",
                                                  style: GoogleFonts.abel(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                      color:
                                                          Colors.grey.shade800),
                                                );
                                              } else {
                                                return const Text("Loading",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold));
                                              }
                                            }),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      height: 10,
                                      width: width / 1.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Health_blog()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        Text(
                                          "Cards",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 10,
                                              width: width / 5,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.black12,
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                              width: width / 8,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.orangeAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var cal = snapshot
                                                      .data!['calories'];
                                                  var calories = cal + 400;
                                                  double cards =
                                                      ((calories * 0.44) / 4);
                                                  return Text(
                                                    "${cards.round()}g | 44%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(children: [
                                        Text(
                                          "Fat",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 10,
                                                  width: width / 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: width / 11,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.purple,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder(
                                              stream: ref1.onValue,
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<dynamic>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var cal = snapshot
                                                      .data
                                                      .snapshot
                                                      .value['calories'];
                                                  var calories = cal + 400;
                                                  double fat =
                                                      (calories * 0.30) / 4;
                                                  return Text(
                                                    "${fat.round()}g | 30%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(children: [
                                        Text(
                                          "Protein",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 10,
                                                  width: width / 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: width / 18,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Colors.pink.shade300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 5),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            StreamBuilder(
                                              stream: ref1.onValue,
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<dynamic>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  var cal = snapshot
                                                      .data
                                                      .snapshot
                                                      .value['calories'];
                                                  var calories = cal + 400;
                                                  double protein =
                                                      (calories * 0.26) / 4;
                                                  return Text(
                                                    "${protein.round()}g | 26%",
                                                  );
                                                }
                                                return const Text("Loading");
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-important-event-50.png",
                                      scale: 2,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        "Note:   As you are in 3rd Trimester \n400 extra calories required",
                                        style: GoogleFonts.catamaran(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  }
                }
                return Center(
                    child: Text(
                  "Loading",
                  style: headingStyle,
                ));
              }),
          const SizedBox(
            height: 10,
          ),
          Diet_user()
        ],
      ),
    );
  }
}

class Diet_user extends StatefulWidget {
  Diet_user({Key? key}) : super(key: key);

  @override
  State<Diet_user> createState() => _Diet_userState();
}

class _Diet_userState extends State<Diet_user> {
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
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            var condition = snapshot.data?['condition'];
            //------------------PCOD
            if (condition == "PCOD") {
              return PCOD_DIET();
            }
            //----------------- Diabetes Type 1 Diet
            else if (condition == "Diabetes Type 1") {
              return Diabetes_1();
            } else if (condition == "Pregnancy") {
              return Pregnancy_diet();
            }
            //-------------------Diabetes Type 2 Diet
            else if (condition == "Diabetes Type 2") {
              return Diabetes_2();
            }
            //------------------Diet for Weight loss and gain
            else if (condition == "None" || condition == "Cholesterol") {
              return none_conditon_1();
            }
          } else {
            // Handle the case when there is no data
            return Center(child: CircularProgressIndicator()); // or any other placeholder widget
          }
        } else {
          // Handle other connection states
          return Center(child: CircularProgressIndicator()); // or any other placeholder widget
        }

        // Add a default return statement
        return Container(); // or any other default widget
      },
    );
    // return StreamBuilder<DocumentSnapshot>(
    //   stream:
    //       FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
    //   builder:
    //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //       if (snapshot.hasData && snapshot.data != null) {
    //     //     var usercalories = snapshot.data!['calories'];
    //     //     // return Text(
    //     //     //   "$usercalories Calories",
    //     //     //   style: const TextStyle(
    //     //     //       fontSize: 18.0, fontWeight: FontWeight.normal),
    //     //     // );
    //     //             if (snapshot.hasData) {
    //     //   var condition = snapshot.data?['condition'];
    //     //   //------------------PCOD
    //     //   if (condition == "PCOD") {
    //     //     return PCOD_DIET();
    //     //   }
    //     //   //----------------- Diabetes Type 1 Diet
    //     //   else if (condition == "Diabetes Type 1") {
    //     //     return Diabetes_1();
    //     //   } else if (condition == "Pregnancy") {
    //     //     return Pregnancy_diet();
    //     //   }
    //     //   //-------------------Diabetes Type 2 Diet
    //     //   else if (condition == "Diabetes Type 2") {
    //     //     return Diabetes_2();
    //     //   }
    //     //   //------------------Diet for Weight loss and gain
    //     //   else if (condition == "None" || condition == "Cholesterol") {
    //     //     return none_conditon();
    //     //   }
    //     // // } else {
    //     // //   return Center(
    //     // //       child: Text(
    //     // //     "Loading",
    //     // //     style: headingStyle,
    //     // //   ));

    //     //    else {
    //     //     return const Text("Loading ",
    //     //         style: TextStyle(
    //     //             fontSize: 10.0,
    //     //             letterSpacing: 1.5,
    //     //             fontWeight: FontWeight.bold));
    //     //   }
    //     if (snapshot.hasData) {
    //       var condition = snapshot.data?['condition'];
    //       //------------------PCOD
    //       if (condition == "PCOD") {
    //         return PCOD_DIET();
    //       }
    //       //----------------- Diabetes Type 1 Diet
    //       else if (condition == "Diabetes Type 1") {
    //         return Diabetes_1();
    //       } else if (condition == "Pregnancy") {
    //         return Pregnancy_diet();
    //       }
    //       //-------------------Diabetes Type 2 Diet
    //       else if (condition == "Diabetes Type 2") {
    //         return Diabetes_2();
    //       }
    //       //------------------Diet for Weight loss and gain
    //       else if (condition == "None" || condition == "Cholesterol") {
    //         return none_conditon();
    //       }
    //     } else {
    //       return Center(
    //           child: Text(
    //         "Loading",
    //         style: headingStyle,
    //       ));

    //     }

    //   },
    // );
  }
}

class calories_user extends StatefulWidget {
  calories_user({Key? key}) : super(key: key);

  @override
  State<calories_user> createState() => _calories_userState();
}

class _calories_userState extends State<calories_user> {
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
              "$usercalories Calories",
              style: const TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.normal),
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

class none_conditon extends StatefulWidget {
  @override
  State<none_conditon> createState() => _none_conditonState();
}

class _none_conditonState extends State<none_conditon> {
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
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<DocumentSnapshot>(
        stream:
            FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            int calories = snapshot.data!['calories'];
            var breakfast1 = (calories * 0.20).ceil();
            var breakfast2 = (calories * 0.25).ceil();
            var lunch1 = (calories * 0.25).ceil();
            var lunch2 = (calories * 0.30).ceil();
            var snacks1 = (calories * 0.10).ceil();
            var snack2 = (calories * 0.15).ceil();
            var dinner1 = (calories * 0.30).ceil();
            var dinner2 = (calories * 0.30).ceil();
           if (snapshot.hasData && calories <= 2000) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-sunny-side-up-eggs-96.png",
                                      scale: 1.8,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("BreakFast ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$breakfast1 - $breakfast2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Idly, Protein Shake's / Milk , Dry Fruits",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(height: 5),
                  //--------------------------LUNCH
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 130,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-lunch-64.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Lunch ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$lunch1 - $lunch2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Rice , Chapati, Dal (Red Gran) Potato curry / Leafy vegetable",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(height: 5),
                  //--------------------------SANCKS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-snacks-100.png",
                                      scale: 1.8,
                                      color: Colors.orange.shade900,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Snacks ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$snacks1 - $snack2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Nutrichoice Biscuit , Apple Veg Sandwich",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(height: 5),
                  //--------------------------DINNER
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 160,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/dinner_diet_page.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Dinner ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$dinner1 - $dinner2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Rice, Jowar Roti, Brinjal Curry or Moong Dal/ Panner curry, Curd/ Butter Milk",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              );
            } else if (snapshot.hasData && calories <= 2300) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-sunny-side-up-eggs-96.png",
                                      scale: 1.8,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("BreakFast ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$breakfast1 - $breakfast2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Rava Dosa, Milk, Dry Fruits,Sprots\n"
                                    "Idly,Green Tea, Bread Toast, Beetroot Juice",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //--------------------------LUNCH
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 170,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-lunch-64.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Lunch ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$lunch1 - $lunch2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Veg Soup,Rice, Pulka Chicken/ Dal, Rasam/ Rajma curry Capsicum curry/ Mushroom kurma/ Cauliflower, Curd",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //--------------------------SANCKS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-snacks-100.png",
                                      scale: 1.8,
                                      color: Colors.orange.shade900,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Snacks ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$snacks1 - $snack2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Grapes/ Ragi Java/ Roasted Nut's/ Coconut Dry Fruit Laddu/ Oat's Laddu",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //--------------------------DINNER
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 160,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/dinner_diet_page.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Dinner ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$dinner1 - $dinner2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Veg Soup, Rice, Jower Roti, Mutton curry/ Potato curry/ Egg curry/ Cabbage curry/ Radish curry, Curd",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              );
            } else if (snapshot.hasData && calories <= 2500) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-sunny-side-up-eggs-96.png",
                                      scale: 1.8,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("BreakFast ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$breakfast1 - $breakfast2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Veg Sandwich/ Egg Paratha, Oat's Idly/ Oat's Dosa Dry fruits or Nut's, Poha/Protein Shake's",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //--------------------------LUNCH
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 170,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-lunch-64.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Lunch ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$lunch1 - $lunch2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Dal/ Fish/ Egg/ Mushroom curry/ Brinjal/ Leafy Vegetable's/Bean's, Chapati/ Pulka, Buttermilk/ curd",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //--------------------------SANCKS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 165,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons8-snacks-100.png",
                                      scale: 1.8,
                                      color: Colors.orange.shade900,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Snacks ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$snacks1 - $snack2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Fruit Juice(Banana,Pineapple,Orange,Grapes) Dark Chocolate's/ Carrot Rava, Laddu/ Raji java, Boiled Egg",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //--------------------------DINNER
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width,
                        height: 190,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/dinner_diet_page.png",
                                      scale: 1.4,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Dinner ",
                                            style: GoogleFonts.abel(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        Text(
                                            "$dinner1 - $dinner2 Kcal recommended",
                                            style: GoogleFonts.catamaran(
                                                fontSize: 15,
                                                letterSpacing: 0.1))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "veg soup/ Veg Salad, Rice(Brown/White),Jowar /Rajma Roti/ Chapati Chicken/Panner Curry/Potato/Brinjal/Ladies finger/Green Leafy Vegetable's,Curd/Butter Milk",
                                    style: GoogleFonts.catamaran(
                                        fontSize: 18, letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              );
            }
            
          } 
            return Center(
                child: Text(
              "Loading",
              style: headingStyle,
            ));
    
       });
  }
}

class bmi extends StatefulWidget {
  bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
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
          if (snapshot.hasData) {
            var bmi = snapshot.data!['bmi'];
            if (bmi < 18.5) {
              return Text("Your BMI is $bmi You are in the Underweight range",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal));
            } else if (bmi < 24.9) {
              return Text(
                  "Your BMI is $bmi You are in the Healthy Weight range",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal));
            } else if (bmi < 29) {
              return Text("Your BMI is $bmi You are in the Overweight range",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal));
            } else if (bmi > 30) {
              return Text("Your BMI is $bmi You are in the Obese range.",
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal));
            }
          }
          return Center(
              child: Text(
            "Loading",
          ));
        });
  }
}
