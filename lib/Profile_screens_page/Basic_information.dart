import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/session_manager.dart';

class Basic_information extends StatefulWidget {
  const Basic_information({Key? key}) : super(key: key);

  @override
  State<Basic_information> createState() => _Basic_informationState();
}

class _Basic_informationState extends State<Basic_information> {

  User? user;
  String? uid;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    uid = user?.uid;
  }

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            toolbarHeight: 50,
            centerTitle: true,
            elevation: 1,
            title: Text(
              "Basic Information",
              style: GoogleFonts.abel(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            backgroundColor: Colors.white),
        body: SafeArea(
          child: SingleChildScrollView(
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      var email = snapshot.data!['email'];
                      var gender = snapshot.data!['gender'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------FULL NAME
                            Row(
                              children: [
                                Image.asset(
                                  "assets/male_icons.png",
                                  width: 43,
                                  height: 43,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: width * 0.8,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Full name",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2.0, top: 1),
                                              child: Text(
                                                "${snapshot.data!["fullName"]}",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            // --------------------------------GENDER
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-gender-equality-96.png",
                                  scale: 2.2,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: width * 0.8,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Gender",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.0, top: 1),
                                            child: Text(
                                              "${snapshot.data!["gender"]}",
                                              style: GoogleFonts.abel(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.black54),
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------EMAIL
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-envelope-96.png",
                                  scale: 2.2,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Email",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "$email",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------AGE
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-birthday-cake-80.png",
                                  scale: 1.8,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Age( in years)",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "${snapshot.data!['age']}",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------Daily Activity
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-running-shoe-96.png",
                                  scale: 2.3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Daily Activity",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "${snapshot.data!['Activity']}",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------HEIGHT
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-straight-ruler-96.png",
                                  scale: 2.2,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Height",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "${snapshot.data!['height']} cms",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------WEIGHT
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-weight-64.png",
                                  scale: 1.45,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Current Weight",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "${snapshot.data!["weight"]} kgs",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------BMI
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-bmi-96.png",
                                  scale: 2.2,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "BMI",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "${snapshot.data!['bmi']}",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            //--------------------------------MEDICAL CONDITION
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-stethoscope-96.png",
                                  scale: 2.2,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Medical Conditions",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "${snapshot.data!['condition']}",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 10.0),
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text("Specific condition" , style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black),),
                            //       // const SizedBox(width: 15.0,),
                            //       Padding(padding: const EdgeInsets.only(left: 20.0),
                            //         child: DropdownButton<String>(
                            //           focusColor:Colors.white,
                            //           style: const TextStyle(color: Colors.pinkAccent),
                            //           dropdownColor: Colors.blue.shade50,
                            //           value: mecicalconvalue,
                            //           onChanged: (String? newValue){setState(() {mecicalconvalue = newValue!;});},
                            //           items: mecicalconitems.map<DropdownMenuItem<String>>((String value){
                            //             return DropdownMenuItem<String>(child: Text(value , style:  GoogleFonts.poppins(fontSize: 20)),value: value);}).toList(),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            //-------------------------------LOCATION
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons8-user-location-96.png",
                                  scale: 2.2,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: width / 1.23,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Location",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 2),
                                              child: Text(
                                                "India",
                                                style: GoogleFonts.abel(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    color: Colors.black54),
                                              ))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      );
                    } else {
                      return const Text(
                        "Loading",
                        style: TextStyle(
                          color: Color.fromRGBO(39, 105, 171, 1),
                          fontFamily: 'Nunito',
                          fontSize: 20,
                        ),
                      );
                    }
                  })
              //==================================================
              ),
        ));
  }
}
