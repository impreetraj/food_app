import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/menus/cake.dart';
import 'package:food_app/pages/menus/chaat.dart';
import 'package:food_app/pages/menus/chicken.dart';
import 'package:food_app/pages/menus/chowmein.dart';
import 'package:food_app/pages/menus/cutlet.dart';
import 'package:food_app/pages/menus/makhani.dart';
import 'package:food_app/pages/menus/pakora.dart';
import 'package:food_app/pages/onboard.dart';
import 'package:food_app/support/style.dart';
import 'package:google_sign_in/google_sign_in.dart';

var size;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  email() {
    String value = '';
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      value = currentUser.email.toString();
    }
    return value;
  }

  List image = [
    {"id": 1, "image_path": "assets/slider/slider1.jpg"},
    {"id": 2, "image_path": "assets/slider/slider2.webp"},
    {"id": 3, "image_path": "assets/slider/slider3.jpg"},
  ];

  final CarouselSliderController carouselcontroller =
      CarouselSliderController();

  int currentIndex = 0;
  void logout() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => onboard(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,

        backgroundColor: Colors.orange,
        title: Row(
          children: [
            Text(
              "Welcome To",
              style: TextStyle(fontSize: 24, color: Colors.black87),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/logo/logo.png',
                  fit: BoxFit.cover,
                  width: 130.0,
                  height: 44.0,
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: 30.0,
                              right: MediaQuery.of(context).size.width / 4.9),
                          child: Text(
                            "Dellicious Food",
                            style: AppWidget.boldTextBlack(),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Discover and Get Great Food",
                            style: AppWidget.smallboldTextBlack(),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 5, top: 13.0),
                    child: GestureDetector(
                        onTap: () {
                          logout();
                        },
                        child: Icon(
                          Icons.logout,
                          size: 40,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 37,
              ),
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4.4,
                  child: CarouselSlider(
                      items: [
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Image.asset(
                            "assets/slider/offer1.webp",
                            fit: BoxFit.cover,
                          ),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Image.asset("assets/slider/offer2.jpg",
                              fit: BoxFit.cover),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Image.asset("assets/slider/offer3.jpg",
                              fit: BoxFit.cover),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Image.asset("assets/slider/offer4.jpg",
                              fit: BoxFit.cover),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Image.asset("assets/slider/offer5.jpg",
                              fit: BoxFit.cover),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Image.asset("assets/slider/offer6.webp",
                              fit: BoxFit.cover),
                        )),
                      ],
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(seconds: 1)))),
              SizedBox(
                height: 37,
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "Food item",
                  style: AppWidget.bigboldTextBlack(),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu("assets/logo/cake_logo.jpeg", "Cake"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pakora()));
                        },
                        child: Container(
                            child: menu("assets/logo/bread_pakora_logo.jpeg",
                                "Pakora"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Chaat()));
                        },
                        child: Container(
                            child:
                                menu("assets/logo/chaat_logo.jpeg", "Chaat"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chicken()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/chicken_logo.jpeg", "Chicken"))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chowmein()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/chowmein_logo.jpeg", "Chowmein"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cutlet()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/cutlet_logo.jpeg", "Cutlet"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Makhani()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/dal-makhani_logo.jpeg", "Dal"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu("assets/logo/dosa_logo.jpeg", "Dosa"))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu("assets/logo/egg_logo.jpeg", "Egg"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/fish-fry_logo.jpeg", "Fish"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child:
                                menu("assets/logo/golgappa.jpeg", "Golgappa"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu("assets/logo/ice-cream_logo.jpeg",
                                "Ice-cream"))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/mix-veg_logo.jpeg", "Mix-veg"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu("assets/logo/momo_logo.jpeg", "Momo"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/mushroom_logo.jpeg", "Mushroom"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/panner_logo.jpeg", "Panner"))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child:
                                menu("assets/logo/paratha.jpeg", "Paratha"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child:
                                menu("assets/logo/pasta_logo.jpeg", "Pasta"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child:
                                menu("assets/logo/pizza_logo.jpeg", "Pizza"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu("assets/logo/Roll_logo.jpeg", "Roll"))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child:
                                menu("assets/logo/salad_logo.jpeg", "Salad"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/samosa_logo.jpeg", "Samosa"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/soft-drink_logo.jpeg", "Drink"))),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        child: Container(
                            child: menu(
                                "assets/logo/sweets_logo.jpeg", "Sweets"))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(email().toString())
                  .doc("profile")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return new CircularProgressIndicator();
                }
                Map<String, dynamic> profile =
                    snapshot.data!.data() as Map<String, dynamic>;
                    
                return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 3.6,
                          decoration: BoxDecoration(color: Colors.orange),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(70)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(70),
                                        child: Image.network(
                                            profile['photoUrl'].toString())),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0, top: 10),
                                  child: Container(
                                    child: Text(
                                      profile['name'].toString().toUpperCase(),
                                      style: AppWidget.carttitle(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 14.0, top: 5),
                                  child: Container(
                                    child: Text(profile['email'].toString(),
                                        style: AppWidget.cartprice()),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 19,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 12,
                              top: MediaQuery.of(context).size.height / 47),
                          child: GestureDetector(
                              child: Text(
                            "Service",
                            style: AppWidget.bigboldTextBlack(),
                          )),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 19,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 12,
                              top: MediaQuery.of(context).size.height / 47),
                          child: GestureDetector(
                              child: Text(
                            "About",
                            style: AppWidget.bigboldTextBlack(),
                          )),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 19,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 12,
                              top: MediaQuery.of(context).size.height / 47),
                          child: GestureDetector(
                              child: Text(
                            "Contact us",
                            style: AppWidget.bigboldTextBlack(),
                          )),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 19,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 12,
                              top: MediaQuery.of(context).size.height / 47),
                          child: GestureDetector(
                              onTap: () {
                                logout();
                              },
                              child: Text(
                                "Logout",
                                style: AppWidget.bigboldTextBlack(),
                              )),
                        ),
                      ]),
                );
              })
              ),
    );
  }
}

slideFood(String image) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Image.asset(
                "$image",
                width: size.width / 4.3,
                height: size.height / 6,
                fit: BoxFit.cover,
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: size.height / 8, left: size.width / 11.5),
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.black,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}

menu(
  String image,
  String name,
) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38),
          child: Image.asset(
            "$image",
            width: size.width / 5.4,
            height: size.height / 10.8,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(
        "$name",
        style: AppWidget.menuTextBlack(),
      )
    ],
  );
}
