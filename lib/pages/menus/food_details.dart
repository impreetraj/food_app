import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/buyNow.dart';
import 'package:food_app/support/style.dart';

class foodDetail extends StatefulWidget {
  final String name;
  final String id;
  final String image;
  final String disp;
  final int price;
  const foodDetail(
      {Key? key,
      required this.name,
      required this.image,
      required this.disp,
      required this.price,
      required this.id,
      });

  @override
  State<foodDetail> createState() => _foodDetailState();
}

var numb = 1;
var total;

class _foodDetailState extends State<foodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 225, 225),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "${widget.image}",
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.name,
                style: AppWidget.bigboldTextBlack(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13, top: 7),
              child: Text(
                widget.disp,
                style: AppWidget.fooddisp(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Total price \nRs.${total != null ? widget.price : widget.price * numb}",
                    style: AppWidget.menuPrice(),
                  ),
                ),
                Container(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 2.2),
                      child: Material(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => setState(() {
                                if (numb > 1) {
                                  numb--;
                                }
                              }),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                            ),
                            Container(
                                width: 32,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 250, 225, 225),
                                ),
                                child: Center(
                                    child: Text(
                                  "$numb",
                                  style: AppWidget.menucart(),
                                ))),
                            InkWell(
                              onTap: () => setState(() {
                                numb++;
                              }),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    textStyle: AppWidget.menuBuy(),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () async {
                    String value = '';
                    var currentUser = FirebaseAuth.instance.currentUser;
                    if (currentUser != null) {
                      value = currentUser.email.toString();
                    }
                    funCart() {
                      var User = FirebaseFirestore.instance
                          .collection(value + 'cart')
                          .doc()
                          .id;

                      return User;
                    }

                    Map<String, dynamic> fdata = {
                      "name": widget.name.toString(),
                      "price": widget.price,
                      "finalPrice": (widget.price * numb),
                      "image": widget.image.toString(),
                      "number": numb,
                      "uid": funCart().toString(),
                      "discription": widget.disp.toString(),
                      "id": widget.id,
                    };

                    
                                          DocumentReference documentReference =
                                              await FirebaseFirestore.instance
                                                  .collection(value + 'cart')
                                                  .doc(widget.id);

                                          DocumentSnapshot snapshot =
                                              await documentReference.get();

                                          if (snapshot.exists) {
                                            final message = SnackBar(
                                                backgroundColor: Colors.orange,
                                                content: Text(
                                                  "Product is already exist in cart",
                                                  style: AppWidget.cartprice(),
                                                ));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(message);
                                            Duration(seconds: 1);
                                          } 

                     await FirebaseFirestore.instance
                        .collection(value + 'cart')
                        .doc(widget.id)
                        .set(fdata);
                                          
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 35,
                    child: Center(
                      child: Text(
                        "Add to cart",
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    textStyle: AppWidget.menuBuy(),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => buyForm(
                                title: widget.name,
                                image: widget.image,
                                discription: widget.disp,
                                quantity: numb,
                                price: widget.price)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: Text(
                      "Buy now",
                      style: AppWidget.menuBuy(),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
