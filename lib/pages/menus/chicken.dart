import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/support/style.dart';

import 'food_details.dart';

class Chicken extends StatefulWidget {
  const Chicken({super.key});

  @override
  State<Chicken> createState() => _ChickenState();
}

class _ChickenState extends State<Chicken> {
  final List<Map<String, dynamic>> chicken = [
     {
      "id": "FDchicken1",
      "name": "Spicy Malvani Chicken",
      "image": "assets/chicken/chk1.jpg",
      "price": 320,
      "discription":
          "A fiery curry with a coconut base. The highlight of this chicken curry is the freshly-made malvani masala. A perfect recipe for all the spice lovers out there, Malvani chicken curry is a hot, delectable chicken recipe from the konkan region of Maharashtra."
    },
     {
      "id": "FDchicken2",
      "name": "Chicken Tikka Masala",
      "image": "assets/chicken/chk2.jpg",
      "price": 400,
      "discription":
          "Thick, curd based chicken curry with  a melange of spices and chicken breasts tossed together. Pair with rice or chapati and have a whole meal for a dinner party. "
    },
     {
      "id": "FDchicken3",
      "name": "Butter Chicken",
      "image": "assets/chicken/chk3.jpg",
      "price": 380,
      "discription":
          "This one's a keeper. Marinated overnight, the chicken is roasted and cooked in tomato puree, cream and masalas. A perfect dinner party recipe, this North-Indian style chicken recipe is made throughout the country with equal zest."
    },
     {
      "id": "FDchicken4",
      "name": "Nimbu aur Hari Mirch ka Murg",
      "image": "assets/chicken/chk4.webp",
      "price": 420,
      "discription":
          "A squeeze of lime makes everything better. A tangy, spicy chicken dish to prepare for a dinner party or casually at home. It's a different yet super quick and easy chicken recipe."
    },
     {
      "id": "FDchicken5",
      "name": "Chicken Stew with Appam",
      "image": "assets/chicken/chk5.webp",
      "price":180 ,
      "discription":
          "A lovely curry made with distinct flavors, packed with spices and simmered in coconut milk."
    },
     {
      "id": "FDchicken6",
      "name": "Murgh Rezala",
      "image": "assets/chicken/chk6.jpg",
      "price": 200,
      "discription":
          "A popular Bengali curry with Mughlai origins, Murgh Rezala curry is rich and robust."
    },
     {
      "id": "FDchicken7",
      "name": "Sali Marghi",
      "image": "assets/chicken/chk7.webp",
      "price": 150,
      "discription":
          "Sali Marghi is an age-old Parsi preparation. Chicken cooked in a tangy tomato gravy and topped with crisp, fried potato strings"
    },
     {
      "id": "FDchicken8",
      "name": "Chicken Do Pyaaza",
      "image": "assets/chicken/chk8.jpg",
      "price":200 ,
      "discription":
          "This recipe uses double the quantity of onions used in a regular curry, thus the name. A Punjabi favourite with freshly-made garam masala, ginger-garlic, kasoori methi, cream and a host of spices."
    },
     {
      "id": "FDchicken9",
      "name": "Kolhapuri Chicken Curry",
      "image": "assets/chicken/chk9.webp",
      "price": 250,
      "discription":
          "Kolhapuri cuisine is known to be spicy and full of flavour. This dish is no less, chicken curry cooked with a special Kolhapuri masala that uses bold flavours of peanut oil, bay leaf, black pepper and cloves"
    },
     {
      "id": "FDchicken10",
      "name": "Al Hachi Chicken",
      "image": "assets/chicken/chk10.webp",
      "price":220 ,
      "discription":
          "A Kashmiri delight, this is an interesting chicken recipe to prepare at home."
    },
     {
      "id": "FDchicken11",
      "name": "Hyderabadi Green Chicken",
      "image": "assets/chicken/chk11.webp",
      "price": 180,
      "discription":
          "This Hyderabadi green chicken is a popular recipe that is made during weddings and other special occasions. This recipe has a taste that we generally don't get to have in other chicken recipes."
    },
  ];


   List<Map<String, dynamic>> dummyList = [];

  @override
  void initState() {
    dummyList = chicken;
    super.initState();
  }

  List<Map<String, dynamic>> resultss = [];

  void runfile(String key) {
    if (key.isEmpty) {
      resultss = chicken;
    } else {
      resultss = chicken
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
                  "Chicken Item",
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
