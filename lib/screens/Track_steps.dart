import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Track_steps extends StatefulWidget {
  const Track_steps({Key? key}) : super(key: key);

  @override
  State<Track_steps> createState() => _Track_stepsState();
}

class _Track_stepsState extends State<Track_steps> {
  @override
  Widget build(BuildContext context) {
    final  width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:
      AppBar(
          toolbarHeight: 50, centerTitle: true, elevation: 1,
          title: Text("Track Steps", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white) ,),
          backgroundColor: Colors.pink[300]),
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.only(left: 15,top: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("0",style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black) ),
                    Text(" of 10,000 steps walked",style: GoogleFonts.abel(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black) ),
                    const SizedBox(width: 140,),
                    const Icon(Icons.edit,size: 25,),
                  ],
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(height: 8,width: width/1.05, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade400),),
                ),],),),

          const SizedBox(height: 30,),
          Container(
            width: 90, height: width/1.5,
            decoration: const BoxDecoration(color: Colors.white70,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text("Connect to Application",style:GoogleFonts.abel(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.grey.shade600),),
              ),
              const Divider(thickness: 1,),
              const SizedBox(height: 20,),
              Padding(padding: const EdgeInsets.all(8),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons8-google-fit-48.png', width: 25, height: 25),
                        SizedBox(width: width/20,),
                        Text("Google Fit",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey.shade600),),
                        SizedBox(width: width/2.1),
                        GestureDetector(
                          onTap: (){},
                          child: Text("INSTALL",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink),),
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Image.asset('assets/icons8-samsung-health-96.png', width: 25, height: 25),
                        SizedBox(width: width/20,),
                        Text("Samsung Health",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey.shade600),),
                        SizedBox(width: width/2.8),
                        GestureDetector(
                          onTap: (){},
                          child: Text("INSTALL",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink),),
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Image.asset('assets/icons8-heart-health-96.png', width: 25, height: 25),
                        SizedBox(width: width/20,),
                        Text("Health Fit",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey.shade600),),
                        SizedBox(width: width/2.05),
                        GestureDetector(
                          onTap: (){},
                          child: Text("INSTALL",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink),),
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Image.asset('assets/icons8-fitbit-96.png', width: 25, height: 25),
                        SizedBox(width: width/20,),
                        Text("Fit Bit",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.grey.shade600),),
                        SizedBox(width: width/1.8),
                        GestureDetector(
                          onTap: (){},
                          child: Text("INSTALL",style:GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),),
          const SizedBox(height: 15,),
          Container(
            height: width/3,
            decoration: const BoxDecoration(color: Colors.white70,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Didn't find your device?",style: GoogleFonts.abel(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                      const SizedBox(width: 160,),
                      Text("HELP",style: GoogleFonts.abel(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.pink))
                    ]
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text("If you didn't find your device please connnect your device to Google "
                        "Fit.This app will sync with Google Fit and fetch your steps data from there"),
                  ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
