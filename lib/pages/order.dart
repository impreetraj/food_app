import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/orderpage.dart';
import 'package:food_app/support/style.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  email() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser.email.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Order",
          style: AppWidget.bigboldTextBlack(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(email() + "buy")
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

                          // String name = cartData["name"];
                          // String phone = cartData["phone"];
                          // String pin = cartData["pin"];
                          // int price = cartData["price"];
                          // String address = cartData["address"];
                          // String city = cartData["city"];
                          // String descrition = cartData["disc"];
                          // String image = cartData["image"].toString();
                          // int quantity = cartData["quantity"];
                          // String state = cartData["state"];
                          // String title = cartData["title"];
                          // String id = cartData["id"];
                          
                          // String Uid = cartData['uid'];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => 
                                    OrderPage(
                                      name: cartData["name"].toString(),
                                      phone: cartData["phone"].toString(),
                                      pin: cartData["pin"].toString(),
                                      price:  cartData["price"],
                                      address: cartData["address"].toString(),
                                      city: cartData["city"].toString(),
                                      descrition: cartData["disc"].toString(),
                                      image: cartData["image"].toString(),
                                      quantity:cartData["quantity"],
                                      state: cartData["state"].toString(),
                                      title: cartData["title"].toString(),
                                      uid: cartData['uid'].toString(),
                                      id: cartData['id'].toString(),
                                      
                                    ),
                                  )
                                  );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  height: 100,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            cartData['image'],
                                            height: 80,
                                            width: 80,
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Text(
                                             cartData['title'].toString(),
                                              style: AppWidget.carttitle(),
                                            )),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Rs ${cartData['price'].toString()}.00",
                                              style: AppWidget.cartprice(),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Quantity : ${cartData['quantity'].toString()}",
                                              style: AppWidget.cartprice(),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Order Name : ${cartData['name'].toString().toUpperCase()}",
                                              style: AppWidget.cartprice(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text("NO ORDER "),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
