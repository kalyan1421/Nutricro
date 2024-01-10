// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettest2/Profile_screens_page/Basic_information.dart';
import 'package:diettest2/Profile_screens_page/Notication_page.dart';
import 'package:diettest2/Profile_screens_page/Tracker_page.dart';
import 'package:diettest2/auth_controllers/UI/loginscreen.dart';
import 'package:diettest2/pages/workout_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app_settings/app_settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ionicons/ionicons.dart';

class Profile_page extends StatefulWidget {
  Profile_page({Key? key}) : super(key: key);

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.synergyuniversal.receptoria1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  User? user;
  String? uid;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    uid = user?.uid;
  }

  final auth = FirebaseAuth.instance;
  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        Expanded(child: SizedBox()),
                        Center(
                          child: Text(
                            "Profile",
                            style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1, 5),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    color: Colors.grey.shade200)
                              ]),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.settings_outline,
                                size: 30,
                              )),
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(child: profile_pic()),
                    SizedBox(height: 5),
                    Center(child: username()),
                    Center(
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasData) {
                              String gender = snapshot.data!["gender"];
                              String age = snapshot.data!["age"];

                              String capname = gender.capitalize!;
                              return Text(
                                "$capname, $age years old",
                                style: GoogleFonts.assistant(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              );
                            } else {
                              return Text(
                                "Loading",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              );
                            }
                          }),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(1, 3),
                                      spreadRadius: 1,
                                      blurRadius: 5),
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(-2, -1),
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ],
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(20)),
                            width: width * 0.25,
                            height: width * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/profilepage/wieght_scale.png",
                                  width: width * 0.09,
                                ),
                                SizedBox(height: 5),
                                StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(uid)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<DocumentSnapshot>
                                            snapshot) {
                                      if (snapshot.hasData) {
                                        String weight =
                                            snapshot.data!["weight"];
                                        return Text(
                                          "$weight Kg",
                                          style: GoogleFonts.assistant(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        );
                                      } else {
                                        return Text(
                                          "Loading",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        );
                                      }
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(1, 3),
                                      spreadRadius: 2,
                                      blurRadius: 5),
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(-2, -1),
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ],
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(20)),
                            width: width * 0.25,
                            height: width * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/profilepage/scale.png",
                                  width: width * 0.09,
                                ),
                                SizedBox(height: 5),
                                StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(uid)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<DocumentSnapshot>
                                            snapshot) {
                                      if (snapshot.hasData) {
                                        String height =
                                            snapshot.data!["height"];
                                        return Text(
                                          "$height cms",
                                          style: GoogleFonts.assistant(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        );
                                      } else {
                                        return Text(
                                          "Loading",
                                          style: GoogleFonts.abel(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        );
                                      }
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // useremail(),assets\profilepage\scale.png
                    // const SizedBox(height: 5),
                    // location(),
                    // const SizedBox(height: 15),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Basic_information(),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Basic_information()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.list_alt,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 20),
                            Text("Basic Information",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Colors.black)),
                            Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 26,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1),
                      GestureDetector(
                        onTap: () async {
                          const url = 'https://mywebsite-da9a2.web.app/#/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.set_meal_sharp,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text("Food Recpies",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Colors.black)),
                            Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 26,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Workout_page()));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.fitness_center,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text("Work Out Exercise",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          const url = 'https://mywebsite-da9a2.web.app/#/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.help_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text("Help & Support",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppSettings.openAppSettings();
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text("Setting ",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          logout(context);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.settings,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text("Logout ",
                                style: GoogleFonts.abel(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Colors.black))
                          ],
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

class username extends StatefulWidget {
  @override
  State<username> createState() => _usernameState();
}

class _usernameState extends State<username> {
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
            String name = snapshot.data!["fullName"];
            String capname = name.capitalize!;
            return Text(
              "$capname",
              style: GoogleFonts.assistant(
                  fontWeight: FontWeight.bold, fontSize: 32),
            );
          } else {
            return Text(
              "Loading",
              style:
                  GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 10),
            );
          }
        });
  }
}

class useremail extends StatefulWidget {
  @override
  State<useremail> createState() => _useremailState();
}

class _useremailState extends State<useremail> {
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
          // if (snapshot.hasData && snapshot.data != null) {
          if (snapshot.hasData) {
            var email = snapshot.data!["email"];
            return Text(
              "$email",
              style:
                  GoogleFonts.abel(fontWeight: FontWeight.normal, fontSize: 15),
            );
          } else {
            return const Text(
              "Loading",
            );
          }
        });
  }
}

class userheight extends StatefulWidget {
  userheight({Key? key}) : super(key: key);

  @override
  State<userheight> createState() => _userheightState();
}

class _userheightState extends State<userheight> {
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
    return Container(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var name = snapshot.data!["height"];
              return Text("Height: $name cms",
                  style: GoogleFonts.dotGothic16(
                      fontSize: 20, color: Colors.white));
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
          }),
    );
  }
}

class userAge extends StatefulWidget {
  @override
  State<userAge> createState() => _userAgeState();
}

class _userAgeState extends State<userAge> {
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
    return Container(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var name = snapshot.data!["age"];
              return Text("Age: $name years",
                  style: GoogleFonts.dotGothic16(
                      fontSize: 20, color: Colors.white));
            } else {
              return Text(
                "Loading",
                style: const TextStyle(
                  color: Color.fromRGBO(39, 105, 171, 1),
                  fontFamily: 'Nunito',
                  fontSize: 20,
                ),
              );
            }
          }),
    );
  }
}

class userWeight extends StatefulWidget {
  @override
  State<userWeight> createState() => _userWeightState();
}

class _userWeightState extends State<userWeight> {
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
    return Container(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var name = snapshot.data!["weight"];
              return Text("Weight: $name Kg",
                  style: GoogleFonts.dotGothic16(
                      fontSize: 20, color: Colors.white));
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
          }),
    );
  }
}

class profile_pic extends StatefulWidget {
  const profile_pic({super.key});

  @override
  State<profile_pic> createState() => _profile_picState();
}

class _profile_picState extends State<profile_pic> {
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
            String profileimage = snapshot.data!['profileImageUrl'];
            return Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                      image: NetworkImage(profileimage), fit: BoxFit.cover)),
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
        });
  }
}

class usergender extends StatefulWidget {
  @override
  State<usergender> createState() => _usergenderState();
}

class _usergenderState extends State<usergender> {
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
            var gender = snapshot.data!["gender"];
            return Text("Gender: $gender",
                style:
                    GoogleFonts.dotGothic16(fontSize: 20, color: Colors.white));
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
        });
  }
}

class location extends StatefulWidget {
  location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  String _city = '';
  String place = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    var placemark = placemarks.first;
    if (mounted) {
      setState(() {
        _city = placemark.locality!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _city == null
          ? const Text("Loading...")
          : Text(
              "City: $_city india",
              style:
                  GoogleFonts.abel(fontWeight: FontWeight.normal, fontSize: 15),
            ),
    );
  }
}
