import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/menus/food_details.dart';
import 'package:food_app/support/style.dart';

class Chaat extends StatefulWidget {
  const Chaat({super.key});

  @override
  State<Chaat> createState() => _ChaatState();
}

class _ChaatState extends State<Chaat> {
  final List<Map<String, dynamic>> chaat = [
    {
      "id": "FDchaat1",
      "name": "Aloo chanay ki chaat",
      "image": "assets/chaat/chaat1.jpg",
      "price": 70,
      "discription":
          "Aloo chana chaat recipe aka aloo chole chaat recipe is a healthy lip smacking chaat recipe Indian. It is spicy, full of refreshing flavours and easy to make. "
    },
    {
      "id": "FDchaat2",
      "name": "Aloo dahi chaat ",
      "image": "assets/chaat/chaat2.jpg",
      "price": 75,
      "discription":
          "Aloo dahi chaat is one of the most desired Indian street food It is one of the simplest chaat recipes with amazing flavours and irresistible taste."
    },
    {
      "id": "FDchaat3",
      "name": "Aloo tikki chaat ",
      "image": "assets/chaat/chaat3.jpg",
      "price": 75,
      "discription":
          "Aloo tikki chaat recipe aka alu tikki chaat is a luscious chaat recipe  It is spicy, sweet & tangy, full of refreshing flavours and easy to make snack recipe."
    },
    {
      "id": "FDchaat4",
      "name": "Aloo Chaat recipe ",
      "image": "assets/chaat/chaat4.JPG",
      "price": 70,
      "discription":
          "Aloo Chaat recipe is one of the most simple and easiest Indian street food recipes which is immensely famous in India. "
    },
    {
      "id": "FDchaat5",
      "name": "leftover dhokla chaat",
      "image": "assets/chaat/chaat5.jpg",
      "price": 100,
      "discription":
          "Dhokla chaat is a very simple and refreshing fusion chaat recipe Indian.This salivating preparation is mostly relished as evening snack . "
    },
    {
      "id": "FDchaat6",
      "name": "Chana chaat recipe",
      "image": "assets/chaat/chaat6.JPG",
      "price": 90,
      "discription":
          "Chana chaat recipe aka chole chaat recipe is a healthy and refreshing chaat recipe Indian. It is hugely popular in the subcontinents of south Asia. "
    },
    {
      "id": "FDchaat7",
      "name": "Crispy papdi chaat",
      "image": "assets/chaat/chaat7.JPG",
      "price": 60,
      "discription":
          "Papdi Chaat recipe is one of the most lip-smacking recipes for chaat which is immensely famous in every street and corner of India. "
    },
    {
      "id": "FDchaat8",
      "name": "Palak patta chaat",
      "image": "assets/chaat/chaat8.JPG",
      "price": 70,
      "discription":
          "Palak patta chaat aka palak chaat recipe is an exemplary recipe for chaat which is also renowned as one of the popular delhi street food"
    },
    {
      "id": "FDchaat9",
      "name": "Ragda chaat",
      "image": "assets/chaat/chaat9.JPG",
      "price": 50,
      "discription":
          "Ragda recipe is one of the most important components of many Indian street food. It is a thick spicy gravy which is the heart of many chaat recipe Indian."
    },
    {
      "id": "FDchaat10",
      "name": "Ragda pattice chaat",
      "image": "assets/chaat/chaat10.jpg",
      "price": 70,
      "discription":
          "Ragda pattice recipe aka ragda patties recipe is a lip smacking chaat recipe which is crazily popular in the subcontinents of northern and western India, "
    },
  ];

  List<Map<String, dynamic>> dummyList = [];

  @override
  void initState() {
    dummyList = chaat;
    super.initState();
  }

  List<Map<String, dynamic>> resultss = [];

  void runfile(String key) {
    if (key.isEmpty) {
      resultss = chaat;
    } else {
      resultss = chaat
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
                  "Chaat Item",
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
                                          var discription = dummyList
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
                                                  disp: discription,
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
                                            "uid": funCart().toString(),
                                            "Id": dummyList
                                                .elementAt(index)['id']
                                                .toString(),
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
