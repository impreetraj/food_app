import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/support/style.dart';

import 'food_details.dart';

class Chowmein extends StatefulWidget {
  const Chowmein({super.key});

  @override
  State<Chowmein> createState() => _ChowmeinState();
}

class _ChowmeinState extends State<Chowmein> {
  final List<Map<String, dynamic>> chowmein = [
    {
      "id": "FDchowmein1",
      "name": "Chicken Chow Mein",
      "image": "assets/chowmein/chow1.webp",
      "price":200,
      "discription":
          "Chicken Chow mein is a popular variety of Chow mein made from wheat noodles. The crunchiness of vegetables like onions, cabbage, carrots, and bell peppers along with tender bits of chicken makes this dish delicious."
    },
    {
      "id": "FDchowmein2",
      "name": "Pan Fried Noodles",
      "image": "assets/chowmein/chow2.webp",
      "price": 100,
      "discription":
          "Pan Fried Noodles are noodles that are made from flour. They are first boiled and then stirred until crispy. The gravy of meat, vegetables, and seafood are used to top these crispy noodles."
    },
    {
      "id": "FDchowmein3",
      "name": "Sichuan Noodles",
      "image": "assets/chowmein/chow3.webp",
      "price":120,
      "discription":
          "These noodles are stir-fried with ginger and garlic paste, flower peppers which is the most important and signature in Sichuan cuisine, and chilies."
    },
    {
      "id": "FDchowmein4",
      "name": "Noodles with Meat Sauce",
      "image": "assets/chowmein/chow4.webp",
      "price": 130,
      "discription":
          "Meat broth and pork are the main ingredients of this dish. The pork is shredded along with shallots, onions, chinese mushrooms, soy sauce, brown sugar, and spice powder."
    },
    {
      "id": "FDchowmein5",
      "name": "Drunken Noodles",
      "image": "assets/chowmein/chow5.webp",
      "price":170,
      "discription":
          "Drunken Noodle is a Thai dish which is influenced by Chinese cuisine. It is also known as Phat Khi Mo which means drunkard. The taste is unique as compared to other noodles."
    },
    {
      "id": "FDchowmein6",
      "name": "Liangpi chowmein recipe",
      "image": "assets/chowmein/chow6.webp",
      "price": 150,
      "discription":
          " It is so rich in flavor that contains flavors like sweet, sour, nutty, crispy, tangy, and spicy. The ingredients like chili oil, garlic, and black vinegar enhance the taste of these noodles."
    },
    {
      "id": "FDchowmein7",
      "name": "Calamari Lemon Noodles",
      "image": "assets/chowmein/chow7.webp",
      "price": 120,
      "discription":
          "Calamari Lemon Noodles are simple Chinese noodles with soup served with steamed or fried calamari which is famous seafood."
    },
    {
      "id": "FDchowmein8",
      "name": "Singapore Noodles",
      "image": "assets/chowmein/chow8.webp",
      "price": 170,
      "discription":
          "The hot spicy flavor is given by the authentic curry powder used. They are usually only eaten with vegetables but beef, chicken, scrambled eggs, and prawns to enhance the taste."
    },
    {
      "id": "FDchowmein9",
      "name": "Noodle Salad chowmein",
      "image": "assets/chowmein/chow9.webp",
      "price": 140,
      "discription":
          "The noodles are garnished with soy sauce, fish sauce, peanut butter, and dressed with sesame oil."
    },
    {
      "id": "FDchowmein10",
      "name": "Stir-Fry Chicken Noodles",
      "image": "assets/chowmein/chow10.webp",
      "price":220,
      "discription":
          "In China, they are served in many dumpling houses and restaurants. These are stir-fried with vegetables and served with beef or chicken cutlets. "
    },
    {
      "id": "FDchowmein11",
      "name": "Paneer Noodles",
      "image": "assets/chowmein/chow11.webp",
      "price":200,
      "discription":
          "Addition of paneer makes it a healthy dish as it contains an adequate amount of protein required by the body. They also have vegetables like cabbage, bell peppers, and onion."
    },
    
  ];

   List<Map<String, dynamic>> dummyList = [];

  @override
  void initState() {
    dummyList = chowmein;
    super.initState();
  }

  List<Map<String, dynamic>> resultss = [];

  void runfile(String key) {
    if (key.isEmpty) {
      resultss = chowmein;
    } else {
      resultss = chowmein
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(key.toLowerCase()))
          .toList();
    }

    setState(() {
      dummyList = resultss;
    });
  }

  TextEditingController searchController = TextEditingController();

  bool search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: search
              ? Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "Search....",
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: (value) {
                      runfile(value);
                    },
                  ),
                )
              : Text(
                  "Chowmein Item",
                  style: AppWidget.bigboldTextBlack(),
                ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  search = !search;

                  if (!search) {
                    searchController.clear();
                  }
                });
              },
              icon: search ? Icon(Icons.close) : Icon(Icons.search),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "Feeling like a cakewal? Explore \n   our amazing range of cakes!",
              style: AppWidget.menuTitle(),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: dummyList.isNotEmpty
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent:
                                MediaQuery.of(context).size.height / 2.8),
                        padding: EdgeInsets.all(20),
                        itemCount: dummyList.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            // onTap: () {
                            //   var name =
                            //       dummyList.elementAt(index)['name'].toString();
                            //   var image = dummyList.elementAt(index)['image'];
                            //   var price =  dummyList.elementAt(index)['price'].toString();
                            //   var discption = dummyList
                            //       .elementAt(index)['description']
                            //       .toString();
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => foodDetail(
                            //           name: name,
                            //           image: image,
                            //           disp: discption,
                            //           price: price,
                            //         ),
                            //       ));

                            // showModalBottomSheet(
                            //     context: context,
                            //     builder: (context) => Column(
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             Padding(
                            //               padding: const EdgeInsets.all(9.0),
                            //               child: ClipRRect(
                            //                 borderRadius:
                            //                     BorderRadius.circular(22),
                            //                 child: Image.asset(
                            //                   dummyList.elementAt(index)['image'],
                            //                   width: MediaQuery.of(context)
                            //                           .size
                            //                           .width /
                            //                       1.9,
                            //                   height: 210,
                            //                 ),
                            //               ),
                            //             ),
                            //             // SizedBox(height: 10,),
                            //             Container(
                            //                 child: Text(
                            //               dummyList
                            //                   .elementAt(index)['name']
                            //                   .toString(),
                            //               style: AppWidget.bigboldTextBlack(),
                            //             )),
                            //             Padding(
                            //               padding: const EdgeInsets.all(10.0),
                            //               child: Text(
                            //                 dummyList
                            //                     .elementAt(
                            //                         index)['description']
                            //                     .toString(),
                            //                 style: AppWidget.menuPrice(),
                            //               ),
                            //             )
                            //           ],
                            //         ));
                            // },
                            child: SingleChildScrollView(
                              child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var name = dummyList
                                              .elementAt(index)['name']
                                              .toString();
                                          var image = dummyList
                                              .elementAt(index)['image'];
                                          var price = dummyList
                                              .elementAt(index)['price'];
                                          var discption = dummyList
                                              .elementAt(index)['discription']
                                              .toString();
                                              var id = dummyList
                                              .elementAt(index)['id']
                                              .toString();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    foodDetail(
                                                  name: name,
                                                  image: image,
                                                  disp: discption,
                                                  price: price,
                                                  id: id,
                                                ),
                                              ));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.asset(
                                            dummyList.elementAt(index)['image'],
                                            height: 140,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        dummyList
                                            .elementAt(index)["name"]
                                            .toString(),
                                        style: AppWidget.menuName(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Rs. ${dummyList.elementAt(index)['price']}",
                                        style: AppWidget.menuPrice(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ElevatedButton(
                                        onPressed: () {
                                          String value = '';
                                          var currentUser =
                                              FirebaseAuth.instance.currentUser;
                                          if (currentUser != null) {
                                            value =
                                                currentUser.email.toString();
                                          }
                                          funCart() {
                                            var User = FirebaseFirestore
                                                .instance
                                                .collection(value + 'cart')
                                                .doc()
                                                .id;

                                            return User;
                                          }

                                          Map<String, dynamic> fdata = {
                                            "name": dummyList
                                                .elementAt(index)['name']
                                                .toString(),
                                            "price": dummyList
                                                .elementAt(index)['price'],
                                            "finalPrice": dummyList
                                                .elementAt(index)['price'],
                                            "image": dummyList
                                                .elementAt(index)['image']
                                                .toString(),
                                            "number": 1,
                                            "Id": dummyList
                                                .elementAt(index)['id']
                                                .toString(),
                                            "uid": funCart().toString(),
                                            "discription": dummyList
                                                .elementAt(index)['discription']
                                                .toString(),
                                          };

                                          FirebaseFirestore.instance
                                              .collection(value + 'cart')
                                              .doc(fdata['uid'])
                                              .set(fdata);
                                        },
                                        child: Text("Add to cart"),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange),
                                      )
                                      // child: GestureDetector(
                                      //   onTap: ()  {
                                      //     String value = '';
                                      //     var currentUser = FirebaseAuth
                                      //         .instance.currentUser;
                                      //     if (currentUser != null) {
                                      //       value = currentUser.uid;
                                      //     }

                                      //     Map<String, dynamic> fdata = {
                                      //       "name": dummyList
                                      //           .elementAt(index)['name']
                                      //           .toString(),
                                      //       "price": dummyList
                                      //           .elementAt(index)['price']
                                      //           .toString(),
                                      //       "image": dummyList
                                      //           .elementAt(index)['image']
                                      //           .toString(),
                                      //       "number": 1,
                                      //     };

                                      //     FirebaseFirestore.instance
                                      //         .collection(value+'cart')
                                      //         .add(fdata);

                                      //     print(value);
                                      //   },
                                      //   child: Container(
                                      //     width: MediaQuery.of(context)
                                      //         .size
                                      //         .width,
                                      //     height: 29,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(29),
                                      //       color: Colors.orange,
                                      //     ),
                                      //     child: Center(
                                      //         child: Text(
                                      //       "Add to cart",
                                      //       style: AppWidget.menuPrice(),
                                      //     )),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Text(
                        "Not found",
                        style: AppWidget.boldTextBlack(),
                      )),
          ],
        ));
  }
}

