import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettest2/Dashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User_Details_2 extends StatefulWidget {
  const User_Details_2({super.key});

  @override
  State<User_Details_2> createState() => _User_Details_2State();
}

class _User_Details_2State extends State<User_Details_2> {
  String activityValue = "Active";
  List<String> mecicalconitems = <String>[
    "None",
    "PCOD",
    "Diabetes Type 1",
    "Diabetes Type 2",
    "Cholesterol",
    "Pregnancy"
  ];
  String mecicalconvalue = "None";

  List<String> spemecicalconitems = <String>[
    "None",
    "1-12 weeks",
    "13-26 weeks",
    "27-40 weeks",
  ];
  List<String> goalitems = <String>[
    "Lose Weight",
    "Maintain Weight",
    "Gain Weight"
  ];
  String goalvalue = 'Maintain Weight';
  String spemecicalconvalue = "None";
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF80608B),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(
                "Fitness & Special Considerations",
                style: GoogleFonts.robotoSlab(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "Discover the Perfect Meal Plan for Your Wellness Goals",
                style: GoogleFonts.robotoSlab(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Medical Conditions: Brief Overview :",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Color(0XFFffe2d6))),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFffe2d6).withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.blue.shade50,
                        value: mecicalconvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            mecicalconvalue = newValue!;
                          });
                        },
                        items: mecicalconitems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              child: Text(
                                value,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: spemecicalconvalue == value
                                      ? Colors.black
                                      : Colors.black,
                                ),
                                // selectionColor: Color(0XFFffe2d6),
                              ),
                              value: value);
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: mecicalconvalue == "Pregnancy",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Specific condition",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Color(0XFFffe2d6)),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0XFFffe2d6).withOpacity(0.8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.blue.shade50,
                          value: spemecicalconvalue,
                          onChanged: (String? newValue) {
                            setState(() {
                              spemecicalconvalue = newValue!;
                            });
                          },
                          items: spemecicalconitems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                child: Text(value,
                                    style: GoogleFonts.poppins(fontSize: 20)),
                                value: value);
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Healthy Aspirations",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Color(0XFFffe2d6))),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFffe2d6).withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.blue.shade50,
                        value: goalvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            goalvalue = newValue!;
                          });
                        },
                        items: goalitems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              child: Text(value,
                                  style: GoogleFonts.poppins(fontSize: 20)),
                              value: value);
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0XFF2c2130).withOpacity(.5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 5),
                        Text("Activity Level",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildActivityColumn("😏", "Inactive"),
                            buildActivityColumn("💪", "Active"),
                            buildActivityColumn("🔥", "Very Active"),
                          ],
                        ),
                        SizedBox(height: 15)
                      ],
                    )),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dash_Screen(
                                initialTabIndex: 0,
                              )));
                  // setState(() {
                  //   loading = true;
                  // });
                  User? user = FirebaseAuth.instance.currentUser;
                  String? uid = user?.uid;
                  userCollection.doc(uid).update({
                    "Activity": activityValue.toString(),
                    "condition": mecicalconvalue.toString(),
                    "goal": goalvalue.toString(),
                    "Specifcondition": spemecicalconvalue.toString()
                  });
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 184, 145, 197),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Next ",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }

  Column buildActivityColumn(String emoji, String label) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              activityValue = label;
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: activityValue == label
                  ? Color(0XFF80608B)
                  : Color(0XFF2c2130).withOpacity(0.6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(emoji, style: TextStyle(fontSize: 45)),
          ),
        ),
        SizedBox(height: 5),
        Text(label,
            style: GoogleFonts.robotoSlab(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
