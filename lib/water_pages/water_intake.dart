import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettest2/pages/Home_page.dart';
import 'package:diettest2/water_pages/water_reminder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import '../Profile_screens_page/Track_WORKOUT.dart';
import '../models/session_manager.dart';
import 'About_water.dart';

enum Options { Reminder, about }
class water_intake extends StatefulWidget {
  const water_intake({Key? key}) : super(key: key);
  final double goalCompleted = 0.7;

  @override
  State<water_intake> createState() => _water_intakeState();
}

class _water_intakeState extends State<water_intake>
    with SingleTickerProviderStateMixin {


  late AnimationController _radialProgressAnimationController;
  late Animation<double> _progressAnimation;
  final Duration fadeInDuration = const Duration(milliseconds: 500);
  final Duration fillDuration = const Duration(seconds: 2);

  double progressDegrees = 0;
  var count = 0;

  // @override
  // void initState() {
  //   super.initState();
    
  // }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }
  var appBarHeight = AppBar().preferredSize.height;
  _buildAppBar() {
    return AppBar(
      title: const Text("Water"),
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            _onMenuItemSelected(value as int);
          },
          offset: Offset(0.0, appBarHeight),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          itemBuilder: (ctx) => [
            _buildPopupMenuItem('Reminder', Options.Reminder.index),
            _buildPopupMenuItem('About',
                Options.about.index),
          ],
        )
      ],
    );
  }
  PopupMenuItem _buildPopupMenuItem(String title, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title),
        ],
      ),
    );
  }
  _onMenuItemSelected(int value) {
    setState(() {
    });

    if (value == Options.Reminder.index) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Track_workout()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> About_Water()));
    }
  }
  final userdetails = FirebaseDatabase.instance.ref("userdetails").child(SessionController().userId.toString());
  double percentage = 0;

  void _incrementPercentage() {
    setState(() {
      percentage = percentage + 0.1;
    });
  }
  void _decremertPercentage() {
    setState(() {
      percentage = percentage - 0.1;
    });
  }
  
  User? user;
  String? uid;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });

    _radialProgressAnimationController.forward();
    uid = user?.uid;
  }

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Calender(),
                Divider(thickness: 2,height: 1,color: Colors.blue.shade100,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,top: 10),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .snapshots(),
                      builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          dynamic Activity = snapshot.data!['Activity'];
                          dynamic weight = snapshot.data!['weight'];
                          int iweight = int.parse(weight);
                          dynamic waterintake = (iweight/30).toStringAsFixed(2);
                          int iwaterintake = int.parse(waterintake.replaceAll(RegExp(r'[^0-9]'),''));
                          if(Activity == 'Sedentary' || Activity =="Light"){
                            int normalwaterintake = (iwaterintake*10+500);dynamic cups =(normalwaterintake/250).toStringAsFixed(0);
                            return Column(
                              children: [
                                Text("Water Intake per day $normalwaterintake ml" ,style: GoogleFonts.breeSerif(fontSize: 20 ,color: Colors.blue.shade900),),
                                const SizedBox(height: 15,),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("${(percentage*11).toInt()} of $cups glasses",style: GoogleFonts.breeSerif(fontSize: 18 ,color: Colors.blue.shade900),),
                                  ),
                                  Padding(padding: const EdgeInsets.only(left: 200),
                                      child: IconButton(onPressed: () { }, icon: const Icon(Icons.edit,size: 25,),)
                                  ),
                                ],),
                              ],
                            );
                          }
                          else if(Activity== "Moderately" || Activity =="Heavy" ){
                            int normalwaterintake = (iwaterintake*10+1000);dynamic cups =(normalwaterintake/250).toStringAsFixed(0);
                            return Column(
                              children: [
                                Text("Water Intake per day $normalwaterintake ml" ,style: GoogleFonts.breeSerif(fontSize: 20 ,color: Colors.blue.shade900),),
                                const SizedBox(height: 15,),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("${(percentage*11).toInt()} of $cups glasses",style: GoogleFonts.breeSerif(fontSize: 18 ,color: Colors.blue.shade900),),
                                  ),
                                  // Padding(padding: const EdgeInsets.only(left: 100),
                                  //     child:
                                      IconButton(onPressed: () {  }, icon: const Icon(Icons.edit,size: 25,),)
                                  // ),
                                ],),
                              ],
                            );
                          }
                        }
                        return Text("Loading",style: GoogleFonts.breeSerif(fontSize: 20 ,color: Colors.blue.shade900),);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: PercentageBar(percentage: percentage,),
                ),
                const SizedBox(height: 30.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 30,),
                      TextButton(child: const Icon(LineIcons.minusCircle ,color: Colors.lightBlue,size: 30), onPressed: percentage <= .05 ? null : _decremertPercentage,),
                      PercentageglassBar(percentage: percentage,),
                      TextButton(child: const Icon(LineIcons.plusCircle ,color: Colors.lightBlue,size: 30,), onPressed: percentage >= .9 ? null : _incrementPercentage,),
                      const SizedBox(width: 30,),
                    ],
                  ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 128,vertical: 20),
                  child: Text("1 Glass (250ml)" ,style: GoogleFonts.breeSerif(fontSize: 20 ,color: Colors.blue.shade900),),
                ),
                const Divider(thickness: 20,height: 20.0,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reminder", style: GoogleFonts.breeSerif(fontSize: 23 ,color: Colors.black),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Water_reminder()));
                      },
                          child: Text("Edit",style:  GoogleFonts.breeSerif(fontSize: 20 ,color: Colors.blue.shade900),))
                    ],
                  ),
                ),
                const Divider(thickness: 20,height: 20.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 5),
                  child: Text("Today's Tips", style: GoogleFonts.breeSerif(fontSize: 23 ,color: Colors.black),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Many fruits and vegetables have a high water content, including melon, cucumbers, lettuce and celery.",style: GoogleFonts.roboto(fontSize: 16 ,color: Colors.black)),
                ),
                const SizedBox(height: 15,),
                const Divider(thickness: 20,height: 20.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 5),
                  child: Row(
                    children: [
                      TextButton(child: Text("About", style: GoogleFonts.breeSerif(fontSize: 23 ,color: Colors.black)),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> About_Water()));},
                      ),
                      const SizedBox(width: 5,),
                      const Icon(Icons.info_outline, size: 20,)
                    ],
                  ),
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}
class PercentageBar extends StatelessWidget {
  final double percentage;

  const PercentageBar({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return
      Container(
          height: 15,
          width: width/1.2,
        decoration: BoxDecoration(
        color: Colors.blue.shade100, borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(padding: const EdgeInsets.only(left: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(10,
                  (index) => Container(
                height: 15,
                width: width/16,
                decoration: BoxDecoration(
                  color: percentage >= (index + 1) / 11 ? Colors.blue.shade400 : null,
                ),
              ),
            ),
          ),
        ),
      );
  }
}
class PercentageglassBar extends StatelessWidget {
  final double percentage;

  const PercentageglassBar({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade100,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 160 * percentage,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // shape: BoxShape.circle,
              color: Colors.blue.shade400,
              // border: Border.all(width: 1),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 40,top: 40),
          child: Align(alignment: Alignment.center, child: SizedBox(width: 50, height: 50,
            child: Icon(Icons.local_drink, color: Colors.white,size: 80,
            ),
          ),),
        )
      ],);
  }
}





