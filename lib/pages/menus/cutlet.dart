import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/support/style.dart';

import 'food_details.dart';

class Cutlet extends StatefulWidget {
  const Cutlet({super.key});

  @override
  State<Cutlet> createState() => _CutletState();
}

class _CutletState extends State<Cutlet> {
  final List<Map<String, dynamic>> cutlets = [
    {
      "id": "FDcutlet1",
      "name": "Bread Vegetable Cutlet",
      "description":
          "Bread is a must have ingredient in my home. I always have a stock of them either in my fridge or in my freezer. And this recipe is one of the thing which i made so often before. It is so easy to put together, you just need few bread slices and few veggies. I have even made them without veggies just with sauted onions and spice powders.",
      "price": 250,
      "image": "assets/cutlets/image1.png"
    },
    {
      "id": "FDcutlet2",
      "name": "Seekh Kebab",
      "description":
          "This is one recipe which i wanted to try for so long. I love the look of it and it just makes me want to take one and grab a bite of it. I made this today and it turned out so juicy and moist. Loved the spices going on this and it is truly yummy.",
      "price": 340,
      "image": "assets/cutlets/image2.png"
    },
    {
      "id": "FDcutlet3",
      "name": "Mutton Shami Kebab",
      "description":
          "Shami kebab is one dish which i wanted to try for quite a long time. When i looked over in google i came across lots of recipes. But nothing gave me satisfaction untill i saw sanjeev kapoors recipe. It looked quite easy to try as well. So i tried it and loved it to the core.",
      "price": 380,
      "image": "assets/cutlets/image3.png"
    },
    {
      "id": "FDcutlet4",
      "name": "Murgh Malai Kebab Recipe",
      "description":
          "This kabab is so juicy and very mild so i am sure kids will love it for sure. This is great for parties. Marinate the chicken the day before and grill it just before serving. It will hit the spot for sure.",
      "price": 260,
      "image": "assets/cutlets/image4.png"
    },
    {
      "id": "FDcutlet5",
      "name": "Easy Chicken Mince Kebab",
      "description":
          "I have been getting lots of mails from viewers asking me to post kebab recipe. I was thinking about that too, even though i love kebab a lot, i haven't made them much at home and posted it here as well. So i finally decided to try variety of kebab and share here.",
      "price": 300,
      "image": "assets/cutlets/image5.png"
    },
    {
      "id": "FDcutlet6",
      "name": "Tangdi Kabab Recipe",
      "description":
          "Simple Tangdi kabab, it is new to me. I was not familiar with that until a viewer requested it. Then i searched online and got an idea about the recipe. I love roasting chicken in oven, since it is less fatty when compared to fried ones and it turn out so juicy.",
      "price": 350,
      "image": "assets/cutlets/image6.png"
    },
    {
      "id": "FDcutlet7",
      "name": "Hara Bhara Kabab",
      "description":
          "This is one kabab which i wanted to make for so long, whenever i have spinach on hand i run out of peas and when i have peas, i just have no spinach on hand. Finally one day i had both ingredients on hand and immediately with no delay i made it. I serve it for lunch and it was delicious.",
      "price": 300,
      "image": "assets/cutlets/image7.png"
    },
    {
      "id": "FDcutlet8",
      "name": "Poha cutlet, No onion",
      "description":
          "Since I make my own bread these days, weekly once I bake it. I trim the crust from all the sides and it makes really good bread crumbs. Though at times I have it as such (fresh crust is really tasty hehe) or with my morning milk, I collect the rest and dry to powder it. I had a full bottle of bread crumbs to try another patty.",
      "price": 220,
      "image": "assets/cutlets/image8.png"
    },
    {
      "id": "FDcutlet9",
      "name": "Dahi Ke Kabab  ",
      "description":
          "An extremely simple and creamy cutlet patties recipe prepared with yoghurt and crumbled paneer. it is an excellent party starter or appetiser snack recipe which has a crisp and flaky texture on the outside and is moist and creamy on the inside. it is typically served with a spicy green or mint chutney but can also be served as it is without any particular sides to it.",
      "price": 180,
      "image": "assets/cutlets/image9.png"
    },
    {
      "id": "FDcutlet10",
      "name": "Veg Kofta in Palak gravy",
      "description":
          "Veg kofta in palak gravy is an exciting way to include greens in your diet, kids will love this and so do the others in family. Kofta in anything tempts me a lot. Name, look, taste, everything tempts me.",
      "price": 240,
      "image": "assets/cutlets/image10.png"
    },
    {
      "id": "FDcutlet11",
      "name": "Moong Dal Vada (Pakoda)",
      "description":
          "Moong dal vada, a quick and tasty vegetarian Indian snack is one of the famous street foods in Gujarat which is usually served with tea or coffee during cold rainy days. It is also known as moong dal pakoda and moong dal bhajiya in different parts of India.",
      "price": 160,
      "image": "assets/cutlets/image11.png"
    },
    {
      "id": "FDcutlet12",
      "name": "Chaat and Tikki",
      "description":
          "Vegetable Cutlet, a delectable combination of mashed potato and green vegetables, is a crisp outside and soft inside Indian potato snack. This stomach filling, mild spicy and crispy Indian cutlet tastes irresistibly delicious when served with assortment of spicy, sweet and sour dips/chutneys like green mint chutney and tamarind chutney, etc.",
      "price": 260,
      "image": "assets/cutlets/image12.png"
    },
  ];

  List<Map<String, dynamic>> dummyList = [];

  @override
  void initState() {
    dummyList = cutlets;
    super.initState();
  }

  List<Map<String, dynamic>> resultss = [];

  void runfile(String key) {
    if (key.isEmpty) {
      resultss = cutlets;
    } else {
      resultss = cutlets
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
                  "Cutlet Item",
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
                                              .elementAt(index)['description']
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
                                                  id:id
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
                                                .elementAt(index)['description']
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
