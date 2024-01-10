import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PCOD_DIET extends StatefulWidget {
  PCOD_DIET({Key? key}) : super(key: key);

  @override
  State<PCOD_DIET> createState() => _PCOD_DIETState();
}

class _PCOD_DIETState extends State<PCOD_DIET> {
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
    DateTime now = DateTime.now();
    int dayOfWeek = now.weekday;

    return getDayContent(dayOfWeek);
  }

  Widget getDayContent(int dayOfWeek) {
    final width = MediaQuery.of(context).size.width;
    switch (dayOfWeek) {
      case DateTime.monday:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------BREAKFAST
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-sunny-side-up-eggs-96.png",
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BreakFast aaaaa ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$breakfast1 - $/breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2 Slices brown bread. +1 slice low-fat cheese+2 Boiled egg whites.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------LUNCH
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-lunch-64.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lunch ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "Veg pulao rice 1 cup+ 1/2 cup Soya Chunk curry+ 1/2 cup Butter Milk.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------SANCKS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-snacks-100.png",
                                scale: 1.8,
                                color: Colors.orange.shade900,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Snacks ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text("1 cup light tea+ 2 wheat rusks",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------DINNER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dinner_diet_page.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dinner ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2 roti/ Chapati+ Ladies finger subji 1/2 cup.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 5,
            )
          ],
        );
      case DateTime.tuesday:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------BREAKFAST
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-sunny-side-up-eggs-96.png",
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BreakFast ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$breakfast1 - $/breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text("Chapati 2 + 1/2 cup green peas curry.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------LUNCH
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-lunch-64.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lunch ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "1 cup rice+ 1/2 cup Dhal+ Palak subji 1/2 cup+ 1/2 cup low-fat curd.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------SANCKS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-snacks-100.png",
                                scale: 1.8,
                                color: Colors.orange.shade900,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Snacks ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "A portion of fruit but avoid high sugar fruits like banana, Jack fruit, Mango, Chikku.)",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------DINNER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dinner_diet_page.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dinner ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "Broken wheat upma 1 cup+ 1/2 cup green beans subji",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 5,
            )
          ],
        );
      case DateTime.wednesday:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------BREAKFAST
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-sunny-side-up-eggs-96.png",
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BreakFast ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$breakfast1 - $/breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text("Methi Parata 2+ 1 tbsp green chutney.  ",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------LUNCH
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-lunch-64.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lunch ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "1 cup rice+ chicken curry (150 gm chicken)+ 1 cup cucumber salad.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------SANCKS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-snacks-100.png",
                                scale: 1.8,
                                color: Colors.orange.shade900,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Snacks ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "1  cup light tea+ Brown rice flakes poha 1/2 cup.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //--------------------------DINNER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dinner_diet_page.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dinner ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "Wheat Dosa 2 + 1/2 cup Bitter guard subji.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        );
      case DateTime.thursday:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------BREAKFAST
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-sunny-side-up-eggs-96.png",
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BreakFast ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$breakfast1 - $/breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "Vegetable Oats Upma 1 cup+ 1/2 cup low-fat milk.  ",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------LUNCH
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-lunch-64.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lunch ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "1/2 cup rice + 2 medium chappatis+1/2 cup Kidney beans curry+ Snake gourd subji 1/2 cup.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------SANCKS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-snacks-100.png",
                                scale: 1.8,
                                color: Colors.orange.shade900,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Snacks ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text("1 cup boiled chana+1 cup light tea.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------DINNER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dinner_diet_page.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dinner ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2 Roti/ chapati+ 1/2 cup mixed veg curry.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        );
      case DateTime.friday:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------BREAKFAST
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-sunny-side-up-eggs-96.png",
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BreakFast ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$breakfast1 - $/breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "Mixed veg Poha 1 cup+ 1/2 cup low-fat milk. ",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------LUNCH
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-lunch-64.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lunch ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2 Chapati+ 1/2 cup cluster beans subji+ Fish curry (100g fish) 1/2 cup.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------SANCKS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-snacks-100.png",
                                scale: 1.8,
                                color: Colors.orange.shade900,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Snacks ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "1 cup tea+ + 2 biscuits (Digestive or Oatmeal.)",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------DINNER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dinner_diet_page.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dinner ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2 Rotis / chapathi + Ridge gourd subji 1/2 cup.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        );
      case DateTime.saturday:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------BREAKFAST
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-sunny-side-up-eggs-96.png",
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BreakFast ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$breakfast1 - $/breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text("Uthappam 2+ 1 tbsp green chutney.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------LUNCH
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-lunch-64.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lunch ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "1 cup rice+ Soya chunk curry1/2 cup+ Ladies finger subji 1/2 cup+ 1 small cup low-fat curd.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------SANCKS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-snacks-100.png",
                                scale: 1.8,
                                color: Colors.orange.shade900,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Snacks ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "A portion of fruit but avoid high sugar fruits likea bnana, Jack fruit, Mango, Chikku.)",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 3,
            ),
            //----------------------------DINNER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dinner_diet_page.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dinner ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "Broken wheat upma 1 cup+ 1/2 cup green beans subji",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        );
      case DateTime.sunday:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------BREAKFAST
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-sunny-side-up-eggs-96.png",
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BreakFast ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$breakfast1 - $/breakfast2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2 Idlis with Sambar 1/2 cup and  Green chutney or Tomato Chutney",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            //--------------------------LUNCH
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-lunch-64.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lunch ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$lunch1 - $lunch2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2  Rotis, 1/2 cup salad with  Fish curry (100 gm fish) and 1/2 cup cabbage subji.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            //--------------------------SANCKS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons8-snacks-100.png",
                                scale: 1.8,
                                color: Colors.orange.shade900,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Snacks ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$snacks1 - $snack2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "A portion of fruit but avoid high sugar fruits like banana, Jack fruit, Mango, Chikku.)",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            //--------------------------DINNER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/dinner_diet_page.png",
                                scale: 1.4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dinner ",
                                      style: GoogleFonts.abel(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  // Text("$dinner1 - $dinner2 Kcal recommended",style: GoogleFonts.catamaran( fontSize: 15 , letterSpacing: 0.1))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                              "2 Roti / chapati. +  Tomato subji 1/2 cup.",
                              style: GoogleFonts.catamaran(
                                  fontSize: 18, letterSpacing: 0.1)),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        );
      default:
        return Text("Unknown day");
    }
  }
}
