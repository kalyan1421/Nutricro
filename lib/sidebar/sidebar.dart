import 'package:diettest2/Profile_screens_page/Health_blogs.dart';
import 'package:diettest2/Profile_screens_page/Setting_page.dart';
import 'package:diettest2/Profile_screens_page/goal_screen.dart';
import 'package:diettest2/pages/Home_page.dart';
import 'package:diettest2/auth_controllers/UI/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Profile_screens_page/Notication_page.dart';
import '../Profile_screens_page/Track_WORKOUT.dart';
import '../models/user_model.dart';
import '../screens/Reminder_page.dart';

class sidebar extends StatefulWidget {
  sidebar({Key? key}) : super(key: key);

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  User? user;

  UserModel? userModel;
  DatabaseReference? userRef;
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
  // final users = FirebaseDatabase.instance.ref("users").child(SessionController().userId.toString());

  // final userdetials = FirebaseDatabase.instance.ref("userdetials");

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
              children: <Widget>[
                Container(width: 200,height: 200,
                  decoration: BoxDecoration(color: Colors.pink[300]),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 33,),
                              onPressed: (){
                                Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Home_page()));
                              }
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0,top: 60),
                            child: Row(
                              children: [
                                Container(width: 70, height: 70,
                                  decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 4.0,),),
                                  child: const Icon(Icons.person_rounded, size: 40,color: Colors.black),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1.0,top:4),
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // StreamBuilder(
                                      //     stream: users.onValue,
                                      //     builder: (context, AsyncSnapshot snapshot){
                                      //       if(snapshot.hasData){
                                      //         var email = snapshot.data.snapshot.value["fullName"];
                                      //         return Text("$email" ,  style: GoogleFonts.abel(color: Colors.white,fontWeight: FontWeight.normal, fontSize: 18),);
                                      //       }
                                      //       else{return const Text("Loading",);
                                      //       }
                                      //     }),
                                      // const SizedBox(height: 5,),
                                      // StreamBuilder(
                                      //     stream: users.onValue,
                                      //     builder: (context, AsyncSnapshot snapshot){
                                      //       if(snapshot.hasData){
                                      //         var email = snapshot.data.snapshot.value["email"];
                                      //         return Text("$email" ,  style: GoogleFonts.abel(color: Colors.white,fontWeight: FontWeight.normal, fontSize: 10),);
                                      //       }
                                      //       else{return const Text("Loading",);
                                      //       }
                                      //     })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                ),
                Container(width: 130,height: 3,
                  decoration: const  BoxDecoration(shape: BoxShape.rectangle,color: Colors.grey),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () => Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Home_page()))
                ),
                ListTile(
                    leading: const Icon(Icons.book_outlined),
                    title: const Text("Health Blogs"),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const Health_blog()))
                ),
                ListTile(
                  leading: const  Icon(Icons.directions_run),
                  title: const Text('Exercise Tracker'),
                  onTap: ()  => Navigator.push(context, MaterialPageRoute(builder: (context)=> const Track_workout())),
                ),
                ListTile(
                  leading: const Icon(Icons.flag),
                  title: const Text('Goals'),
                  onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> const Goal_page())),
                ),
                const Divider(thickness: 5,),
                ListTile(
                  leading: const Icon(Icons.alarm,),
                  title: const Text("Reminder"),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const Reminder_page())),
                ),
                ListTile(
                  leading: const Icon(Icons.notification_important),
                  title: const Text("Notification"),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const  Notification_page())),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Setting"),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const Setting_page())),
                ),
                ListTile(
                  leading: Container(width: 25, height: 25,
                    decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 2.0,),),
                    child: const Icon(Icons.question_mark_outlined, size: 20,color: Colors.black),
                  ),
                  title: const Text("Help and feedback"),
                  onTap: () => null,
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text("Logout"),
                  onTap: (){
                    logout(context);
                  }
                  ),
                  
              ]
          ),

      );
  }
}


