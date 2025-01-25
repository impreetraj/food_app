// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/pages/buyNow.dart';
import 'package:food_app/pages/cartBuyNow.dart';

import 'package:food_app/pages/menus/food_details.dart';
import 'package:food_app/support/cartprice.dart';
import 'package:food_app/support/style.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  fun() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser.email.toString();
    }
  }

  funct() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser.email.toString() + "cart";
    }
  }

  

  var totalprice = 0;

  final CartPriceController cartpricecontroller =
      Get.put(CartPriceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: Text(
          "Cart",
          style: AppWidget.bigboldTextBlack(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(fun() + "cart")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> cartData =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;

                          
                          cartpricecontroller.fetchcartPrice();

                          return Column(
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        foodDetail(
                                                            name: cartData[
                                                                "name"],
                                                            image: cartData[
                                                                "image"],
                                                            disp: cartData[
                                                                "discription"],
                                                            id: cartData['id'],
                                                            price: cartData[
                                                                "price"])));
                                          },
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                cartData["image"],
                                                height: 80,
                                                width: 80,
                                              )),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: Text(
                                                cartData['name'],
                                                style: AppWidget.carttitle(),
                                              )),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                "Rs ${cartData['finalPrice']}.00",
                                                style: AppWidget.cartprice(),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4.6,
                                                height: 33,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.amberAccent),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (cartData['number'] >
                                                            1) {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  fun() +
                                                                      "cart")
                                                              .doc(cartData[
                                                                  'id'])
                                                              .update({
                                                            "number": cartData[
                                                                    'number'] -
                                                                1,
                                                            "finalPrice": (cartData[
                                                                    'price'] *
                                                                (cartData[
                                                                        "number"] -
                                                                    1))
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                          child: Icon(
                                                              Icons.remove)),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        cartData['number']
                                                            .toString(),
                                                        style: AppWidget
                                                            .carttitle(),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                fun() + "cart")
                                                            .doc(
                                                                cartData['id'])
                                                            .update({
                                                          "number": cartData[
                                                                  'number'] +
                                                              1,
                                                          "finalPrice": (cartData[
                                                                  'price'] *
                                                              (cartData[
                                                                      "number"] +
                                                                  1))
                                                        });
                                                      },
                                                      child: Container(
                                                          child:
                                                              Icon(Icons.add)),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                              onPressed: () {
                                                var docId = snapshot
                                                    .data!.docs[index].id;

                                                FirebaseFirestore.instance
                                                    .collection(fun() + "cart")
                                                    .doc(docId)
                                                    .delete();
                                              },
                                              icon: Icon(Icons.delete)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return Text("No data");
                  }
                }  else {
                    return Text("No data");
                  }
              },
            ),
          ),
          Totalprice(),
        ],
      ),
    );
  }
}

class Totalprice extends StatefulWidget {
  const Totalprice({super.key});

  @override
  State<Totalprice> createState() => _TotalpriceState();
}

class _TotalpriceState extends State<Totalprice> {
  final CartPriceController cartpricecontroller =
      Get.put(CartPriceController());
  @override
  Widget build(BuildContext context) {
    cartpricecontroller.fetchcartPrice();
    return Material(
      child: Card(
        elevation: 10,
        child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Total price",
                      style: AppWidget.boldTextBlack(),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      child: Obx(() => Text(
                            "${cartpricecontroller.totalprice.value.obs.string}0",
                            style: AppWidget.boldTextBlack(),
                          )),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    String value = "";
                    final currentUser = await FirebaseAuth.instance.currentUser;
                    if (currentUser != null) {
                      value = currentUser.email.toString();
                    }

                    QuerySnapshot querySnapshot = await FirebaseFirestore
                        .instance
                        .collection(value + 'cart')
                        .get();

                    if (querySnapshot.docs.isEmpty) {

                     
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CbuyForm(),
                          ));
                    }
                  },
                  child: Text("Buy Now"),
                  style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange),
                )
              ],
            )),
      ),
    );
  }
}
