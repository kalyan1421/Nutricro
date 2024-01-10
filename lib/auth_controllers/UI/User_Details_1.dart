import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettest2/auth_controllers/UI/User_Details_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User_Details_1 extends StatefulWidget {
  User_Details_1({
    Key? key,
  }) : super(key: key);

  @override
  State<User_Details_1> createState() => _User_Details_1State();
}

class _User_Details_1State extends State<User_Details_1> {
  final auth = FirebaseAuth.instance;
  bool loading = false;
  final fullnameController = TextEditingController();
  final ageController = TextEditingController();
  final hieghtController = TextEditingController();
  final weightController = TextEditingController();
  var result = '';
  late double bmr, bmrpregnant;
  late int calories, BMRtotal, bmi, Fatcalories;
  late String Waterintake;
  List<bool> isSelected = [true, false, false];
  final formKey = GlobalKey<FormState>();
  List<String> items = <String>[
    "Sedentary",
    "Light",
    "Moderately",
    "Heavy",
    "Athlete"
  ];
  String ActivityValue = "Light";
  String activityValue = "Active";
  List<String> genderitems = <String>["Male", "Female", "Other"];
  String genderValue = "Female";
  String gendervalue = 'Male';
  List<String> mecicalconitems = <String>[
    "None",
    "PCOD",
    "Diabetes Type 1",
    "Diabetes Type 2",
    "Cholesterol",
    "Pregnancy"
  ];
  String mecicalconvalue = "None";
  List<String> goalitems = <String>[
    "Lose Weight",
    "Maintain Weight",
    "Gain Weight"
  ];
  String goalvalue = 'Maintain Weight';
  List<String> spemecicalconitems = <String>[
    "None",
    "1-12 weeks",
    "13-26 weeks",
    "27-40 weeks",
  ];
  String spemecicalconvalue = "None";

  late double caloriesDouble, doublebmi;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF80608B),
        // appBar: AppBar(title: const Text('Details')),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    "Let's get",
                    style: GoogleFonts.robotoSlab(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "to know you!",
                    style: GoogleFonts.robotoSlab(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Find the most suitable meal plan\nfor your healthy needs",
                    style: GoogleFonts.robotoSlab(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 45),
                  Text("Age",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0XFFffe2d6),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: GoogleFonts.poppins(fontSize: 15),
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Age';
                        }
                        return null;
                      },
                      maxLength: 2,
                      decoration: const InputDecoration(
                        hintText: "In years",
                        labelStyle: TextStyle(color: Color(0XFF80608B)),
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text("Height",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0XFFffe2d6),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: GoogleFonts.poppins(fontSize: 15),
                      controller: hieghtController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Hieght';
                        }
                        return null;
                      },
                      maxLength: 3,
                      decoration: const InputDecoration(
                        hintText: "In cms",
                        labelStyle: TextStyle(color: Color(0XFF80608B)),
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text("Weight",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Color(0XFFffe2d6),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: GoogleFonts.poppins(fontSize: 15),
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Weight';
                        }
                        return null;
                      },
                      maxLength: 2,
                      decoration: const InputDecoration(
                        hintText: "in Kgs",
                        labelStyle: TextStyle(color: Color(0XFF80608B)),
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     buildActivityColumn("😏", "Inactive"),
                  //     buildActivityColumn("💪", "Active"),
                  //     buildActivityColumn("🔥", "Very Active"),
                  //   ],
                  // ),

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
                            Text("Gender",
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                buildGenderColumn("🧒🏻", "Male"),
                                buildGenderColumn("👧🏻", "Female"),
                                buildGenderColumn("⚧️", "Transgender"),
                              ],
                            ),
                            SizedBox(height: 25)
                          ],
                        )),
                  ),

                  // SizedBox(height: 30),
                  // Center(
                  //   child: Container(
                  //       width: MediaQuery.of(context).size.width * 0.9,
                  //       height: 180,
                  //       alignment: Alignment.center,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(15),
                  //           color: Color(0XFF2c2130).withOpacity(.5)),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           SizedBox(height: 5),
                  //           Text("Activity Level",
                  //               style: GoogleFonts.robotoSlab(
                  //                   fontSize: 18,
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.w500)),
                  //           SizedBox(height: 15),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               buildActivityColumn("😏", "Inactive"),
                  //               buildActivityColumn("💪", "Active"),
                  //               buildActivityColumn("🔥", "Very Active"),
                  //             ],
                  //           ),
                  //           SizedBox(height: 15)
                  //         ],
                  //       )),
                  // ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      final isValidFrom = formKey.currentState!.validate();
                      if (isValidFrom) {
                        var wt = weightController.text.toString();
                        var iwt = int.parse(wt);
                        var ft = hieghtController.text.toString();
                        var ift = int.parse(ft);
                        var age = ageController.text.toString();
                        var iage = int.parse(age);
                        setState(() {
                          if (iwt != '' && ift != '' && iage != '') {
                            if (gendervalue == "Male") {
                              bmr = (88.362 +
                                  (13.397 * iwt) +
                                  (4.799 * ift) -
                                  (5.677 * iage));
                            } else if (gendervalue == "Female") {
                              bmr = (447.593 +
                                  (9.247 * iwt) +
                                  (3.098 * ift) -
                                  (4.330 * iage));
                            } else if (gendervalue == "Other") {
                              bmr = (88.362 +
                                  (13.397 * iwt) +
                                  (4.799 * ift) -
                                  (5.677 * iage));
                            }
                          }
                          int bmrTotal = (bmr.round());

                          if (ActivityValue == "Sedentary" ||
                              ActivityValue == "Light") {
                            caloriesDouble = (bmrTotal * 1.375);
                          } else if (ActivityValue == "Moderately") {
                            caloriesDouble = (bmrTotal * 1.375);
                          } else if (ActivityValue == "Heavy") {
                            caloriesDouble = (bmrTotal * 1.55);
                          } else if (ActivityValue == "Athlete") {
                            caloriesDouble = (bmrTotal * 1.9);
                          }
                          double hieghtmeter = ift / 100;
                          doublebmi = (iwt / (hieghtmeter * hieghtmeter));
                          bmi = (doublebmi.round());
                          double water = (iwt / 30);
                          Waterintake = water.toStringAsFixed(2);
                          calories = (caloriesDouble.round());
                          BMRtotal = bmrTotal;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => User_Details_2()));
                        setState(() {
                          loading = true;
                        });
                        User? user = FirebaseAuth.instance.currentUser;
                        String? uid = user?.uid;
                        int dt = DateTime.now().millisecondsSinceEpoch;
                        userCollection.doc(uid).update({
                          "UID": uid,
                          "Data": dt,
                          "age": ageController.text.toString(),
                          "height": hieghtController.text.toString(),
                          "weight": weightController.text.toString(),
                          "bmr": BMRtotal,
                          "bmi": bmi,
                          "calories": calories,
                          "Activity": ActivityValue.toString(),
                          "gender": genderValue.toString(),
                          "condition": mecicalconvalue.toString(),
                          "goal": goalvalue.toString(),
                          "waterintake": Waterintake.toString(),
                          "Specifcondition": spemecicalconvalue.toString()
                        });

                        setState(() {
                          loading = false;
                        });
                      } else {
                        return;
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => User_Details_2()));
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
                  // SizedBox(
                  //   height: 350,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Activity:",
                  //       style: GoogleFonts.poppins(fontSize: 20),
                  //     ),
                  //     const SizedBox(
                  //       width: 30.0,
                  //     ),
                  //     DropdownButton<String>(
                  //       value: ActivityValue,
                  //       dropdownColor: Colors.blue.shade50,
                  //       onChanged: (String? newValue) {
                  //         setState(() {
                  //           ActivityValue = newValue!;
                  //         });
                  //       },
                  //       items: items.map<DropdownMenuItem<String>>((String value) {
                  //         return DropdownMenuItem<String>(
                  //             child: Text(
                  //               value,
                  //               style: GoogleFonts.poppins(fontSize: 20),
                  //             ),
                  //             value: value);
                  //       }).toList(),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15),
                  // Row(
                  //   children: [
                  //     Text("Gender:", style: GoogleFonts.poppins(fontSize: 20)),
                  //     const SizedBox(
                  //       width: 30.0,
                  //     ),
                  //     DropdownButton<String>(
                  //       value: gendervalue,
                  //       dropdownColor: Colors.blue.shade50,
                  //       onChanged: (String? newValue) {
                  //         setState(() {
                  //           gendervalue = newValue!;
                  //         });
                  //       },
                  //       items: genderitems
                  //           .map<DropdownMenuItem<String>>((String value) {
                  //         return DropdownMenuItem<String>(
                  //             child: Text(value,
                  //                 style: GoogleFonts.poppins(fontSize: 20)),
                  //             value: value);
                  //       }).toList(),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("Any Medical Condition we should be aware of :",
                  //         style: GoogleFonts.poppins(fontSize: 20)),
                  //     const SizedBox(
                  //       height: 5.0,
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 8.0),
                  //       child: DropdownButton<String>(
                  //         dropdownColor: Colors.blue.shade50,
                  //         value: mecicalconvalue,
                  //         onChanged: (String? newValue) {
                  //           setState(() {
                  //             mecicalconvalue = newValue!;
                  //           });
                  //         },
                  //         items: mecicalconitems
                  //             .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //               child: Text(value,
                  //                   style: GoogleFonts.poppins(fontSize: 20)),
                  //               value: value);
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("Specific condition",
                  //         style: GoogleFonts.poppins(fontSize: 20)),
                  //     const SizedBox(
                  //       height: 5.0,
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 8.0),
                  //       child: DropdownButton<String>(
                  //         dropdownColor: Colors.blue.shade50,
                  //         value: spemecicalconvalue,
                  //         onChanged: (String? newValue) {
                  //           setState(() {
                  //             spemecicalconvalue = newValue!;
                  //           });
                  //         },
                  //         items: spemecicalconitems
                  //             .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //               child: Text(value,
                  //                   style: GoogleFonts.poppins(fontSize: 20)),
                  //               value: value);
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("Goal in your mind",
                  //         style: GoogleFonts.poppins(fontSize: 20)),
                  //     const SizedBox(
                  //       height: 5.0,
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 8.0),
                  //       child: DropdownButton<String>(
                  //         dropdownColor: Colors.blue.shade50,
                  //         value: goalvalue,
                  //         onChanged: (String? newValue) {
                  //           setState(() {
                  //             goalvalue = newValue!;
                  //           });
                  //         },
                  //         items: goalitems
                  //             .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //               child: Text(value,
                  //                   style: GoogleFonts.poppins(fontSize: 20)),
                  //               value: value);
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // RoundButton(
                  //     title: "NEXT",
                  //     loading: loading,
                  //     ontap: () async {
                  //       final isValidFrom = formKey.currentState!.validate();
                  //       var wt = weightController.text.toString();
                  //       var iwt = int.parse(wt);
                  //       var ft = hieghtController.text.toString();
                  //       var ift = int.parse(ft);
                  //       var age = ageController.text.toString();
                  //       var iage = int.parse(age);
                  //       setState(() {
                  //         if (iwt != '' && ift != '' && iage != '') {
                  //           if (gendervalue == "Male") {
                  //             bmr = (88.362 +
                  //                 (13.397 * iwt) +
                  //                 (4.799 * ift) -
                  //                 (5.677 * iage));
                  //           } else if (gendervalue == "Female") {
                  //             bmr = (447.593 +
                  //                 (9.247 * iwt) +
                  //                 (3.098 * ift) -
                  //                 (4.330 * iage));
                  //           } else if (gendervalue == "Other") {
                  //             bmr = (88.362 +
                  //                 (13.397 * iwt) +
                  //                 (4.799 * ift) -
                  //                 (5.677 * iage));
                  //           }
                  //         }
                  //         int bmrTotal = (bmr.round());

                  //         if (ActivityValue == "Sedentary" ||
                  //             ActivityValue == "Light") {
                  //           caloriesDouble = (bmrTotal * 1.375);
                  //         } else if (ActivityValue == "Moderately") {
                  //           caloriesDouble = (bmrTotal * 1.375);
                  //         } else if (ActivityValue == "Heavy") {
                  //           caloriesDouble = (bmrTotal * 1.55);
                  //         } else if (ActivityValue == "Athlete") {
                  //           caloriesDouble = (bmrTotal * 1.9);
                  //         }
                  //         double hieghtmeter = ift / 100;
                  //         doublebmi = (iwt / (hieghtmeter * hieghtmeter));
                  //         bmi = (doublebmi.round());
                  //         double water = (iwt / 30);
                  //         Waterintake = water.toStringAsFixed(2);
                  //         calories = (caloriesDouble.round());
                  //         BMRtotal = bmrTotal;
                  //       });
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => Homepage()));
                  //       setState(() {
                  //         loading = true;
                  //       });
                  //       User? user = FirebaseAuth.instance.currentUser;
                  //       String? uid = user?.uid;
                  //       int dt = DateTime.now().millisecondsSinceEpoch;
                  //       userCollection.doc(uid).update({
                  //         "UID": uid,
                  //         "Data": dt,
                  //         "age": ageController.text.toString(),
                  //         "height": hieghtController.text.toString(),
                  //         "weight": weightController.text.toString(),
                  //         "bmr": BMRtotal,
                  //         "bmi": bmi,
                  //         "calories": calories,
                  //         "Activity": ActivityValue.toString(),
                  //         "gender": genderValue.toString(),
                  //         "condition": mecicalconvalue.toString(),
                  //         "goal": goalvalue.toString(),
                  //         "waterintake": Waterintake.toString(),
                  //         "Specifcondition": spemecicalconvalue.toString()
                  //       });

                  //       setState(() {
                  //         loading = false;
                  //       });
                  //     }),
                ],
              ),
            ),
          ),
        ));
  }

  Column buildActivityColumn(String emoji, String label) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Save the selected activity level when tapped
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

  Column buildGenderColumn(String emoji, String label) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Save the selected gender when tapped
            setState(() {
              genderValue = label;
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: genderValue == label
                  ? Color(0XFF80608B)
                  : Color(0XFF2c2130).withOpacity(0.6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(emoji,
                style: TextStyle(fontSize: 35, color: Colors.white)),
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
