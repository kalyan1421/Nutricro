import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettest2/models/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class none_conditon_1 extends StatefulWidget {
  const none_conditon_1({super.key});

  @override
  State<none_conditon_1> createState() => _none_conditon_1State();
}

class _none_conditon_1State extends State<none_conditon_1> {
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
            return  Column(
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
          }
          return Center(
                child: Text(
              "Loading",
              style: headingStyle,
            ));
        });
  }
}
