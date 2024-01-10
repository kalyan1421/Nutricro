import 'package:diettest2/pages/Home_page.dart';
import 'package:diettest2/pages/Profile_page.dart';
import 'package:diettest2/pages/Diet_page.dart';
import 'package:diettest2/sidebar/sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'pages/workout_page.dart';

class Dash_Screen extends StatefulWidget {
  final int initialTabIndex;
  Dash_Screen({Key? key, required this.initialTabIndex}) : super(key: key);

  @override
  State<Dash_Screen> createState() => _Dash_ScreenState();
}

class _Dash_ScreenState extends State<Dash_Screen>
    with SingleTickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref("userdetials");
  int _selectedTab = 0;
  final List<Widget> _pages = [
    const Home_page(),
    diet_page(),
    const Workout_page(),
    Profile_page(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: SafeArea(
        
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        // child: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(15),
        //     color: Colors.indigo.shade200,
        //   ),
        //   height: 50,
          child:
           GNav(
            onTabChange: (_pages) {
              setState(() {
                _selectedTab = _pages;
              });
            },
            tabs: const [
              GButton(
                text: 'Home',
                gap: 5,
                icon: LineIcons.home,
                iconColor: Colors.black,
                iconActiveColor: Colors.indigo,
                textColor: Colors.indigo,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              ),
              GButton(
                text: 'Meals',
                gap: 5,
                icon: LineIcons.utensils,
                iconColor: Colors.black,
                iconActiveColor: Colors.indigo,
                textColor: Colors.indigo,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              ),
              GButton(
                icon: Icons.fitness_center,
                text: "Work Out",
                iconColor: Colors.black,
                iconActiveColor: Colors.indigo,
                textColor: Colors.indigo,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              ),
              GButton(
                icon: LineIcons.user,
                text: "Profile",
                iconColor: Colors.black,
                iconActiveColor: Colors.indigo,
                textColor: Colors.indigo,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              ),
            ],
          ),
        // ),
      )),
    );
  }
}
