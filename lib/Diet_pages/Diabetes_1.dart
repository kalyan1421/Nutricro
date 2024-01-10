import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/session_manager.dart';
import '../models/theme.dart';

class Diabetes_1 extends StatefulWidget {
  const Diabetes_1({Key? key}) : super(key: key);

  @override
  State<Diabetes_1> createState() => _Diabetes_1State();
}

class _Diabetes_1State extends State<Diabetes_1> {
  final ref1 = FirebaseDatabase.instance.ref("userdetails").child(SessionController().userId.toString());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: ref1.onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            var calories = snapshot.data.snapshot.value['calories'];
            var breakfast1 = (calories*0.20).ceil();var breakfast2 = (calories*0.25).ceil();
            var lunch1 = (calories*0.25).ceil();var lunch2 = (calories*0.30).ceil();
            var snacks1 = (calories*0.10).ceil();var snack2 = (calories*0.15).ceil();
            var dinner1 = (calories*0.30).ceil();var dinner2 = (calories*0.30).ceil();
            if (snapshot.hasData && calories <= 2000) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 120,
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
                                        Text("$breakfast1 - $breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Idly, Protein Shake's / Milk , Dry Fruits", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                                        Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Rice , Chapati, Dal (Red Gran) Potato curry / Leafy vegetable", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                    child: Container(width: width, height: 120,
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
                                        Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Nutrichoice Biscuit , Apple Veg Sandwich", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                                        Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Rice, Jowar Roti, Brinjal Curry or Moong Dal/ Panner curry, Curd/ Butter Milk", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              );
            }
            else if (snapshot.hasData && calories <= 2300) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 150,
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
                                        Text("$breakfast1 - $breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Rava Dosa, Milk, Dry Fruits,Sprots\n"
                                        "Idly,Green Tea, Bread Toast, Beetroot Juice", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                    child: Container(width: width, height: 170,
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
                                        Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Veg Soup,Rice, Pulka Chicken/ Dal, Rasam/ Rajma curry Capsicum curry/ Mushroom kurma/ Cauliflower, Curd", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                    child: Container(width: width, height: 150,
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
                                        Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Grapes/ Ragi Java/ Roasted Nut's/ Coconut Dry Fruit Laddu/ Oat's Laddu", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                                        Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Veg Soup, Rice, Jower Roti, Mutton curry/ Potato curry/ Egg curry/ Cabbage curry/ Radish curry, Curd", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              );
            }
            else if (snapshot.hasData && calories <= 2500) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------BREAKFAST
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: width, height: 150,
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
                                        Text("$breakfast1 - $breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Veg Sandwich/ Egg Paratha, Oat's Idly/ Oat's Dosa Dry fruits or Nut's, Poha/Protein Shake's", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                    child: Container(width: width, height: 170,
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
                                        Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Dal/ Fish/ Egg/ Mushroom curry/ Brinjal/ Leafy Vegetable's/Bean's, Chapati/ Pulka, Buttermilk/ curd", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                                        Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    "Fruit Juice(Banana,Pineapple,Orange,Grapes) Dark Chocolate's/ Carrot Rava, Laddu/ Raji java, Boiled Egg", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
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
                    child: Container(width: width, height: 190,
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
                                        Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text("veg soup/ Veg Salad, Rice(Brown/White),Jowar /Rajma Roti/ Chapati Chicken/Panner Curry/Potato/Brinjal/Ladies finger/Green Leafy Vegetable's,Curd/Butter Milk",
                                    style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              );
            }
            // else if (snapshot.hasData && calories <= 3500) {
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       //---------------------------BREAKFAST
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(width: width, height: 150,
            //             decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
            //             child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
            //               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(padding: const EdgeInsets.only(left: 4),
            //                     child: Row(
            //                       children: [
            //                         Image.asset("assets/icons8-sunny-side-up-eggs-96.png", scale: 1.8,),
            //                         const SizedBox(width: 10,),
            //                         Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Text("BreakFast ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
            //                             Text("$breakfast1 - $breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
            //                   const SizedBox(height: 10,),
            //                   Padding(
            //                     padding: const EdgeInsets.only(left: 4.0),
            //                     child: Text(
            //                         "Veg Sandwich/ Egg Paratha, Oat's Idly/ Oat's Dosa Dry fruits or Nut's, Poha/Protein Shake's", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
            //                   )
            //                 ],
            //               ),
            //             )
            //         ),
            //       ),
            //       const SizedBox(height: 5,),
            //       //--------------------------LUNCH
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(width: width, height: 170,
            //             decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
            //             child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
            //               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(padding: const EdgeInsets.only(left: 4),
            //                     child: Row(
            //                       children: [
            //                         Image.asset("assets/icons8-lunch-64.png", scale: 1.4,),
            //                         const SizedBox(width: 10,),
            //                         Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Text("Lunch ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
            //                             Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
            //                   const SizedBox(height: 10,),
            //                   Padding(
            //                     padding: const EdgeInsets.only(left: 4.0),
            //                     child: Text(
            //                         "Dal/ Fish/ Egg/ Mushroom curry/ Brinjal/ Leafy Vegetable's/Bean's, Chapati/ Pulka, Buttermilk/ curd", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
            //                   )
            //                 ],
            //               ),
            //             )
            //         ),
            //       ),
            //       const SizedBox(height: 5,),
            //       //--------------------------SANCKS
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(width: width, height: 165,
            //             decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
            //             child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
            //               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(padding: const EdgeInsets.only(left: 4),
            //                     child: Row(
            //                       children: [
            //                         Image.asset("assets/icons8-snacks-100.png", scale: 1.8,color: Colors.orange.shade900,),
            //                         const SizedBox(width: 10,),
            //                         Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Text("Snacks ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
            //                             Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
            //                   const SizedBox(height: 10,),
            //                   Padding(
            //                     padding: const EdgeInsets.only(left: 4.0),
            //                     child: Text(
            //                         "Fruit Juice(Banana,Pineapple,Orange,Grapes) Dark Chocolate's/ Carrot Rava, Laddu/ Raji java, Boiled Egg", style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
            //                   )
            //                 ],
            //               ),
            //             )
            //         ),
            //       ),
            //       const SizedBox(height: 5,),
            //       //--------------------------DINNER
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(width: width, height: 190,
            //             decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(10)),),
            //             child: Padding(padding: const EdgeInsets.only(left: 10, top: 5),
            //               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(padding: const EdgeInsets.only(left: 4),
            //                     child: Row(
            //                       children: [
            //                         Image.asset("assets/dinner_diet_page.png", scale: 1.4,),
            //                         const SizedBox(width: 10,),
            //                         Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Text("Dinner ", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
            //                             Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))],),],),),
            //                   const SizedBox(height: 10,),
            //                   Padding(
            //                     padding: const EdgeInsets.only(left: 4.0),
            //                     child: Text("veg soup/ Veg Salad, Rice(Brown/White),Jowar /Rajma Roti/ Chapati Chicken/Panner Curry/Potato/Brinjal/Ladies finger/Green Leafy Vegetable's,Curd/Butter Milk",
            //                         style: GoogleFonts.catamaran( fontSize: 18 , letterSpacing: 0.1)),
            //                   )
            //                 ],
            //               ),
            //             )
            //         ),
            //       ),
            //     ],
            //   );
            // }
          }
          return Center(child: Text("Loading", style: headingStyle,));
        }
    );
  }
}

