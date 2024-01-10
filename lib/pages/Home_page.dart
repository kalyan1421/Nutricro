// ignore_for_file: unused_field, unused_local_variable, must_be_immutable

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:diettest2/Dashscreen.dart';
import 'package:diettest2/Profile_screens_page/Tracker_page.dart';
import 'package:diettest2/auth_controllers/UI/auth_service.dart';
import 'package:diettest2/categories_ui.dart/diet_learning.dart';
import 'package:diettest2/categories_ui.dart/diet_tips.dart';
import 'package:diettest2/categories_ui.dart/yoga.dart';
import 'package:diettest2/favorites/fav_cereal.dart';
import 'package:diettest2/favorites/fav_fruits.dart';
import 'package:diettest2/favorites/fav_juices.dart';
import 'package:diettest2/favorites/fav_vegtables.dart';
import 'package:diettest2/models/session_manager.dart';
import 'package:diettest2/screens/Track_steps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/meal.dart';
import '../utils/radial_progress.dart';
import '../screens/recipe_details.dart';
import '../water_pages/water_intake.dart';
import 'package:intl/intl.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late DateTime selectedDate;
  bool showcalendar = false;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60.0),

              // Calender(),
              DisplayUsername(),
              const SizedBox(height: 15),
              // Calories CARD----------------------------------------------
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // shadow color
                        spreadRadius: 2, // spread radius
                        blurRadius: 5, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Calories",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        SizedBox(width: 15),
                                        Image.asset(
                                          "assets/utiles/calories_icon.png",
                                          scale: 15,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Remaining = Goal-Food+Exercise',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8)),
                                    ),
                                  ]),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: RadialProgress(),
                              ),
                            ]),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 80),
                            CardsProgress(),
                            const SizedBox(
                              height: 10,
                            ),
                            FatProgress(),
                            const SizedBox(
                              height: 10,
                            ),
                            ProteinProgress()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              //Balanced Diet ----------------------------------------------
              categories_row(),
              SizedBox(height: 10),
              choose_fav(),

              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tracker Now",
                  style: GoogleFonts.robotoSlab(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              //TRACKER CARDs-----------------------------------------------
              Trackerbox(),
              SizedBox(height: 10),
              //Recipes ----------------------------------------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: height * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Healthy Eats",
                        style: GoogleFonts.robotoSlab(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < meals.length; i++)
                                _MealCard(
                                  meal: meals[i],
                                ),
                              // }
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProteinProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Protein".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: width * 0.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black12,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: width * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                UserProtein(),
              ])
        ]);
  }
}

class CardsProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "CARBS",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: width * 0.28,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black12,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: width * 0.15,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                UserCards(),
              ])
        ]);
  }
}

class FatProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "FATS",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: width * 0.28,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black12,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: width * 0.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                UserFat(),
              ])
        ]);
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 20,
      ),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, _) {
                  return MealDetailScreen1(
                    meal: meal,
                  );
                  // MealDetailScreen(meal: meal,);
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.black12,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calender extends StatelessWidget {
  Calender({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final hieght = MediaQuery.of(context).size.height;

    return Container(
      child: DatePicker(
        DateTime.now(),
        height: 95,
        width: 70,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.pink,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black12)),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black12)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black12)),
        onDateChange: (date) {},
      ),
    );
  }
}

class DisplayUsername extends StatefulWidget {
  @override
  State<DisplayUsername> createState() => _DisplayUsernameState();
}

class _DisplayUsernameState extends State<DisplayUsername> {
  String _greetingMessage = '';
  late DateTime selectedDate;
  User? user;
  String? uid;

  @override
  void initState() {
    super.initState();
    _getGreeting();
    _initializeCurrentUser();

    selectedDate = DateTime.now();
  }

  void _initializeCurrentUser() async {
    user = FirebaseAuth.instance.currentUser;
    uid = user?.uid;
    setState(() {});
  }

  void _getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      setState(() {
        _greetingMessage = 'Good morning';
      });
    } else if (hour < 15) {
      setState(() {
        _greetingMessage = 'Good afternoon';
      });
    } else if (hour < 20) {
      setState(() {
        _greetingMessage = 'Good evening';
      });
    } else {
      setState(() {
        _greetingMessage = 'Good night';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          Map<String, dynamic>? userData =
              snapshot.data!.data() as Map<String, dynamic>?;

          if (userData != null && userData.containsKey('fullName')) {
            String name = userData['fullName'];
            String profileimage = userData['profileImageUrl'];

            String capname = name;
            String gender = userData['gender'] ??
                ''; // Assuming 'gender' is a field in your user data

            Widget genderIcon;
            if (gender.toLowerCase() == 'male') {
              genderIcon = Image.asset(
                "assets/utiles/male_icon.jpeg",
                scale: 10,
              );
            } else if (gender.toLowerCase() == 'female') {
              genderIcon = Image.asset(
                "assets/utiles/female_icon.png",
                scale: 10,
              );
            } else {
              genderIcon = Icon(Icons.person, size: 24, color: Colors.grey);
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, $capname👋",
                        style: GoogleFonts.robotoSlab(
                            fontWeight: FontWeight.w400, fontSize: 24)),
                    Text(
                      "Today ${DateFormat('MMM dd').format(selectedDate)}",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    logout(context);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(profileimage),
                            fit: BoxFit.contain)),
                  ),
                ),
                SizedBox(width: 15)
              ],
            );
          } else {
            return Center(
              child: Text(
                "Fullname not available",
                style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text(
              "Loading...",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return Center(
            child: Text(
              "Error loading data",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }
}

class Trackerbox extends StatefulWidget {
  @override
  State<Trackerbox> createState() => _TrackerboxState();
}

class _TrackerboxState extends State<Trackerbox> {
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
    late int watercounter = 0;
    late int waterafter = 0;
    final height = MediaQuery.of(context).size.height;
    return Container(
        child: Row(children: <Widget>[
      Column(children: <Widget>[
        //-------------------------------------Work Out Page
        Container(
            width: width / 2.3,
            height: width / 2,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 0.2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 0.2,
                  blurRadius: 5,
                  offset: Offset(2, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Track_Page()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 90,
                        decoration: const ShapeDecoration(
                          color: Colors.transparent,
                          shape: CircleBorder(
                              side: BorderSide(width: 4, color: Colors.black)),
                        ),
                        child: Image.asset(
                          'assets/utiles/running_icon.png',
                          // scale: 5,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Burn At Least",
                  style:
                      GoogleFonts.breeSerif(fontSize: 18, color: Colors.black),
                ),
                Text(
                  "542 Cal",
                  style:
                      GoogleFonts.breeSerif(fontSize: 15, color: Colors.black),
                )
              ],
            )),

        SizedBox(height: 10),
        //--------------------------------------WATER PAGE
        Container(
          width: width / 2.2,
          height: width / 2,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0.2,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0.2,
              blurRadius: 5,
              offset: Offset(5, 5),
            )
          ], borderRadius: BorderRadius.circular(15.0), color: Colors.white),
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                print("Error: ${snapshot.error}");
                return Text("Error: ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data == null) {
                return Text("No data available");
              }

              Map<String, dynamic>? userData =
                  snapshot.data!.data() as Map<String, dynamic>?;

              if (userData != null) {
                String activity = userData['Activity'];
                String weight = userData['weight'];
                int iweight = int.tryParse(weight) ??
                    0; // Use tryParse for safer parsing.
                dynamic waterintake = (iweight / 30).toStringAsFixed(2);
                int iwaterintake = int.tryParse(
                        waterintake.replaceAll(RegExp(r'[^0-9]'), '')) ??
                    0;

                int normalwaterintake;
                dynamic cups;

                if (activity == 'Inactive') {
                  normalwaterintake = (iwaterintake * 10 + 500);
                  cups = (normalwaterintake / 250).toStringAsFixed(0);
                } else if (activity == 'Active' || activity == 'Very Active') {
                  normalwaterintake = (iwaterintake * 10 + 1000);
                  cups = (normalwaterintake / 250).toStringAsFixed(0);
                } else {
                  // Handle other activity cases if needed
                  return Text("Unknown activity type");
                }

                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => water_intake()),
                            );
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            // width: activity == 'Inactive' ? 90 : 70,
                            // height: activity == 'Inactive' ? 90 : 70,
                            decoration: ShapeDecoration(
                              color: Colors.transparent,
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 4,
                                  color: Colors.blue.shade200,
                                ),
                              ),
                            ),
                            child: Center(
                                child: Image.asset(
                              "assets/utiles/glass_10508076.png",
                              width: 60,
                              height: 60,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: activity == 'Inactive' ? 5 : 25,
                    ),
                    Text(
                      "Drink $cups glasses\n"
                      "         of water",
                      style: GoogleFonts.breeSerif(
                        fontSize: activity == 'Inactive' ? 18 : 15,
                        color: Colors.blue[200],
                      ),
                    ),
                  ],
                );
              }

              // If none of the conditions are met, return a generic loading message.
              return Text("loading");
            },
          ),
        ),
      ]),
      SizedBox(width: 20),
      Column(children: <Widget>[
        Container(
            width: width / 2.3,
            height: width / 2,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.2,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.2,
                blurRadius: 5,
                offset: Offset(2, 5),
              ),
            ], borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Track_steps(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.square,
                              size: 60,
                              color: Colors.transparent,
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Image.asset(
                                  'assets/icons8-google-fit-48.png',
                                  width: 30,
                                  height: 30),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                  'assets/icons8-heart-health-96.png',
                                  width: 30,
                                  height: 30),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Image.asset(
                                  'assets/icons8-samsung-health-96.png',
                                  width: 30,
                                  height: 30),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset('assets/icons8-fitbit-96.png',
                                  width: 30, height: 30),
                            ),
                          ],
                        ))),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Track Your steps",
                  style:
                      GoogleFonts.breeSerif(fontSize: 18, color: Colors.black),
                ),
                Text(
                  "Connect Now",
                  style:
                      GoogleFonts.breeSerif(fontSize: 15, color: Colors.black),
                )
              ],
            )),
        const SizedBox(height: 10.0),
        Container(
            width: width / 2.3,
            height: width / 2,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.2,
                blurRadius: 5,
                offset: Offset(0, 10),
              ),
            ], borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Track_Page()));
              },
              child: Center(
                child: Text(
                  "View All\n"
                  "Tracker",
                  style:
                      GoogleFonts.breeSerif(fontSize: 18, color: Colors.black),
                ),
              ),
            )),
      ])
    ]));
  }
}

class bmr extends StatelessWidget {
  final ref1 = FirebaseDatabase.instance
      .ref("userdetails")
      .child(SessionController().userId.toString());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref1.onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading");
          } else if (snapshot.hasData && snapshot.data != null) {
            var bmr = snapshot.data.snapshot.value['bmr'];
            return Text(
              "$bmr",
              style: const TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            );
          } else {
            return const Center(
              child: Text("Loading"),
            );
          }
        });
  }
}

class UserCalories extends StatefulWidget {
  @override
  _UserCaloriesState createState() => _UserCaloriesState();
}

class _UserCaloriesState extends State<UserCalories> {
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
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          Map<String, dynamic>? userData =
              snapshot.data!.data() as Map<String, dynamic>?;

          if (userData != null && userData.containsKey('calories')) {
            var userCalories = userData['calories'];
            return Center(
              child: Text(
                "Calories: $userCalories",
                style: const TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Center(
              child: Text(
                "Calories not available",
                style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text(
              "Loading...",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return Center(
            child: Text(
              "Error loading data",
              style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }
}

class UserProtein extends StatefulWidget {
  UserProtein({Key? key}) : super(key: key);

  @override
  State<UserProtein> createState() => _UserProteinState();
}

class _UserProteinState extends State<UserProtein> {
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
          Map<String, dynamic>? data =
              snapshot.data!.data() as Map<String, dynamic>?;

          if (data != null && data.containsKey('calories')) {
            var calories = data['calories'];
            double protein = (calories * 0.15) / 4;
            return Text("${protein.round()}g left");
          } else {
            return Text("Calories data is missing or invalid");
          }
        }
        return Text("Loading");
      },
    );
  }
}

class UserCards extends StatefulWidget {
  @override
  State<UserCards> createState() => _UserCardsState();
}

class _UserCardsState extends State<UserCards> {
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
          Map<String, dynamic>? data =
              snapshot.data!.data() as Map<String, dynamic>?;

          if (data != null && data.containsKey('calories')) {
            int calories = data['calories'];
            double cards = (calories * 0.65) / 4;
            return Text("${cards.round()}g left");
          } else {
            return Text("Calories data is missing or invalid");
          }
        }
        return Text("Loading");
      },
    );
  }
}

class UserFat extends StatefulWidget {
  @override
  State<UserFat> createState() => _UserFatState();
}

class _UserFatState extends State<UserFat> {
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
          Map<String, dynamic>? data =
              snapshot.data!.data() as Map<String, dynamic>?;

          if (data != null && data.containsKey('calories')) {
            var calories = data['calories'];
            double fat = (calories * 0.25) / 4;
            return Text("${fat.round()}g left");
          } else {
            return Text("Calories data is missing or invalid");
          }
        }
        return const Text("Loading");
      },
    );
  }
}

class BMI extends StatelessWidget {
  final userdetails = FirebaseDatabase.instance
      .ref("userdetails")
      .child(SessionController().userId.toString());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: userdetails.onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            dynamic BMI = snapshot.data.snapshot.value['bmi'];
            if (BMI <= 18.5) {
              return Text("You are Underweight\n"
                  "Your BMI is $BMI");
            } else if (BMI <= 25.0) {
              return Text("You are 	Healthy Weight\n"
                  "Your BMI is $BMI");
            } else if (BMI <= 30.0) {
              return Text("You are Overweight\n"
                  "Your BMI is $BMI");
            } else {
              return Text("You are Obesity\n"
                  "Your BMI is $BMI");
            }
          }
          return const Text("Loading");
        });
  }
}

class waterintake extends StatelessWidget {
  final userdetails = FirebaseDatabase.instance
      .ref("userdetails")
      .child(SessionController().userId.toString());
  late int waterintakeint;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: userdetails.onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            dynamic Activity = snapshot.data.snapshot.value['Activity'];
            dynamic weight = snapshot.data.snapshot.value['weight'];
            int iweight = int.parse(weight);
            dynamic waterintake = (iweight / 30).toStringAsFixed(2);
            int iwaterintake =
                int.parse(waterintake.replaceAll(RegExp(r'[^0-9]'), ''));
            if (Activity == 'Sedentary' || Activity == "Light") {
              int normalwaterintake = (iwaterintake * 10 + 500);
              dynamic cups = (normalwaterintake / 250).toStringAsFixed(0);
              return Text(
                  "$normalwaterintake mill lites $cups cups(250ml per cup) ",
                  style: GoogleFonts.breeSerif(
                    fontSize: 18,
                    color: Colors.blue[200],
                  ));
            } else if (Activity == "Moderately" || Activity == "Heavy") {
              int normalwaterintake = (iwaterintake * 10 + 1000);
              dynamic cups = (normalwaterintake / 250).toStringAsFixed(0);
              return Text(
                  "$normalwaterintake mill lites $cups cups(250ml per cup)",
                  style: GoogleFonts.breeSerif(
                    fontSize: 18,
                    color: Colors.blue[200],
                  ));
            }
          }
          return Text("Loading",
              style: GoogleFonts.breeSerif(
                  fontSize: 18, color: Colors.blue.shade200));
        });
  }
}

class categories_row extends StatefulWidget {
  const categories_row({super.key});

  @override
  State<categories_row> createState() => _categories_rowState();
}

class _categories_rowState extends State<categories_row> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories",
                style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.bold, fontSize: 22)),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dash_Screen(initialTabIndex: 1),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 2, // spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/utiles/diet_icon.png",
                        scale: 13,
                        color: Color(0XFFFF9665),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Diet",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dash_Screen(initialTabIndex: 2),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 2, // spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/utiles/workout_icon.png",
                        scale: 12,
                        color: Color(0XFFFF9665),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Work out",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Diet_tips()),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 2, // spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/utiles/diet_tip_icon.png",
                        scale: 15, color: Color(0XFFFF9665),
                        // color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Tips",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Yoga()),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 2, // spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/utiles/yoga_icon.png",
                        scale: 12,
                        color: Color(0XFFFF9665),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Yoga",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => diet_learning()),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 2, // spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/utiles/Diet_learning.png",
                        scale: 14,
                        color: Color(0XFFFF9665),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Learning",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class choose_fav extends StatelessWidget {
  const choose_fav({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Choose Your Favorites",
          style:
              GoogleFonts.robotoSlab(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EdamamApiExample(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/utiles/strawberry.png",
                        scale: 6,
                      ),
                      Text("Fruits",
                          style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ]),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Fav_vegtables(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/utiles/vegtable_icon.png",
                      scale: 8,
                    ),
                    SizedBox(height: 15),
                    Text("Vegtable",
                        style: GoogleFonts.robotoSlab(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Fav_cereal(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/utiles/orange_icon.png",
                      scale: 8,
                    ),
                    SizedBox(height: 15),
                    Text("Citrus Fruits",
                        style: GoogleFonts.robotoSlab(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Fav_juices(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/utiles/juices_icon.png",
                      scale: 8,
                    ),
                    SizedBox(height: 15),
                    Text("Juices",
                        style: GoogleFonts.robotoSlab(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
