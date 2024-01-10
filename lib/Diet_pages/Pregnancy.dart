import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/session_manager.dart';
import '../models/theme.dart';

class Pregnancy_diet extends StatefulWidget {
  const Pregnancy_diet({Key? key}) : super(key: key);

  @override
  State<Pregnancy_diet> createState() => _Pregnancy_dietState();
}
final ref1 = FirebaseDatabase.instance.ref("userdetails").child(SessionController().userId.toString());

class _Pregnancy_dietState extends State<Pregnancy_diet> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: ref1.onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData ) {
            var Specifcondition = snapshot.data.snapshot.value['Specifcondition'];
            if(Specifcondition == "1-12 weeks"){
              var calories = snapshot.data.snapshot.value['calories'];
              var breakfast1 = (calories*0.20).ceil();var breakfast2 = (calories*0.25).ceil();
              var lunch1 = (calories*0.25).ceil();var lunch2 = (calories*0.30).ceil();
              var snacks1 = (calories*0.10).ceil();var snack2 = (calories*0.15).ceil();
              var dinner1 = (calories*0.30).ceil();var dinner2 = (calories*0.30).ceil();
              return Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: width, height: 100,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("As you are in 1st Trimester there is no extra calories required",style: GoogleFonts.catamaran( fontSize: 20 , letterSpacing: 0.1)),
                      )),
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: width, height: 130,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-sunny-side-up-eggs-96.png", scale: 1.8,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("BreakFast ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$breakfast1 - $breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ]
                                      ,),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2 Idlis with Sambar 1/2 cup and  Green chutney or Tomato Chutney", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------LUNCH
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 130,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-lunch-64.png", scale: 1.4,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Lunch ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2  Rotis, 1/2 cup salad with Fish curry or Broccoli, Curd or Buttermilk", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------SANCKS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 140,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-snacks-100.png", scale: 1.8,color: Colors.orange.shade900,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Snacks ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "A portion of fruit but avoid high sugar fruits like banana, Jack fruit, Mango, Dry fruits.)", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------DINNER
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 130,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/dinner_diet_page.png", scale: 1.4,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Dinner ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2 Roti / chapati. +  Tomato subji 1/2 cup or Rice with Dal, Brinjal poultry meat curry.", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              );
            }
            else if(Specifcondition == "13-26 weeks"){
              var cal = snapshot.data.snapshot.value['calories'];
              var calories = cal+300;
              var breakfast1 = (calories*0.20).ceil();var breakfast2 = (calories*0.25).ceil();
              var lunch1 = (calories*0.25).ceil();var lunch2 = (calories*0.30).ceil();
              var snacks1 = (calories*0.10).ceil();var snack2 = (calories*0.15).ceil();
              var dinner1 = (calories*0.30).ceil();var dinner2 = (calories*0.30).ceil();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 130,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-sunny-side-up-eggs-96.png", scale: 1.8,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("BreakFast ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$breakfast1 - $breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ]
                                      ,),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Milk, Boiled egg, Oat's, Upma, Smoothies(Drink), Peanut's", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------LUNCH
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 160,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-lunch-64.png", scale: 1.4,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Lunch ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2  Rotis or Pulka, 1/2 cup salad with  Green leafy vegetables and 1/2 cup cabbage, bean's, kale subji.", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------SANCKS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 140,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-snacks-100.png", scale: 1.8,color: Colors.orange.shade900,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Snacks ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Sprouts, Cheese, A portion of fruit but avoid high sugar fruits like banana, Jack fruit, Mango.)", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------DINNER
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 160,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/dinner_diet_page.png", scale: 1.4,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Dinner ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2 Roti / chapati. +  Tomato subji 1/2 cup or Brown or White Rice with fish or Poultry mea or liver.", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              );
            }
            else if(Specifcondition == "27-40 weeks"){
              var cal = snapshot.data.snapshot.value['calories'];
              var calories = cal+400;
              var breakfast1 = (calories*0.20).ceil();var breakfast2 = (calories*0.25).ceil();
              var lunch1 = (calories*0.25).ceil();var lunch2 = (calories*0.30).ceil();
              var snacks1 = (calories*0.10).ceil();var snack2 = (calories*0.15).ceil();
              var dinner1 = (calories*0.30).ceil();var dinner2 = (calories*0.30).ceil();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 140,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-sunny-side-up-eggs-96.png", scale: 1.8,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("BreakFast ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$breakfast1 - $breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ]
                                      ,),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2 Idlis with Sambar 1/2 cup and  Green chutney or Tomato Chutney, Toast Bread, Almond", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------LUNCH
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 160,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-lunch-64.png", scale: 1.4,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Lunch ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2  Rotis, 1/2 cup salad with Brinjal or Potato or Dal or Fish curry (100 gm fish) and 1/2 cup cabbage subji.", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------SANCKS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 165,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons8-snacks-100.png", scale: 1.8,color: Colors.orange.shade900,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Snacks ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Sesame seeds ladoo, Ragi Java, A portion of fruit but avoid high sugar fruits like banana, Jack fruit, Mango, Chikku.)", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  //--------------------------DINNER
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 160,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/dinner_diet_page.png", scale: 1.4,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Dinner ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                                        Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                      ],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "2 Roti / chapati. + Tomato subji 1/2 cup or "
                                        "Brown or White Rice + Panner or Green leafy vegetables or meat.", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              );
            }
          }
          return Center(child: Text("Loading" , style: headingStyle,));
        }
    );
  }
}
