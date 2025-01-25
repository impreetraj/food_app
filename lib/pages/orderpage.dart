import 'package:flutter/material.dart';
import 'package:food_app/pages/menus/food_details.dart';
import 'package:food_app/support/style.dart';

class OrderPage extends StatefulWidget {
  final String name;
  final String phone;
  final String pin;
  final int price;
  final String address;
  final String city;
  final String descrition;
  final String image;
  final int quantity;
  final String state;
  final String title;
  final String uid;
  final String id;

  const OrderPage({
    Key? key,
    required this.name,
    required this.phone,
    required this.pin,
    required this.price,
    required this.address,
    required this.city,
    required this.descrition,
    required this.image,
    required this.quantity,
    required this.state,
    required this.title,
    required this.uid,
    required this.id,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 30,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 3.5),
                      child: Text(
                        "Your Order",
                        style: AppWidget.boldTextBlack(),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                "Order Item : ",
                style: AppWidget.bigboldTextBlack(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 100,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            double stprice = widget.price / widget.quantity;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => foodDetail(
                                      name: widget.title,
                                      image: widget.image,
                                      disp: widget.descrition,
                                      id: widget.id,
                                      price: stprice.toInt()),
                                ));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                widget.image,
                                height: 80,
                                width: 80,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Container(
                                    child: Text(
                                                                  widget.title,
                                                                  style: AppWidget.carttitle(),
                                                                ),
                                  )),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                child: Text(
                                  "Rs ${widget.price}.00",
                                  style: AppWidget.cartprice(),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                child: Text(
                                  "Quantity : ${widget.quantity}",
                                  style: AppWidget.cartprice(),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  child: Text(
                                    "Order Id : ${widget.uid.substring(0,8).toUpperCase()}",
                                    style: AppWidget.carttitle(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                "Order Address : ",
                style: AppWidget.bigboldTextBlack(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 232,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 14, left: 14, top: 14),
                          child: Container(
                            child: Text(
                              "Name : ${widget.name.toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 14, left: 14, top: 14),
                          child: Container(
                            child: Text(
                              "State : ${widget.state.toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 14, left: 14, top: 14),
                          child: Container(
                            child: Text(
                              "City : ${widget.city.toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 14, left: 14, top: 14),
                          child: Container(
                            child: Text(
                              "Pin : ${widget.pin.toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 14, left: 14, top: 14),
                          child: Container(
                            child: Text(
                              "Address : ${widget.address.toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 14, left: 14, top: 14),
                          child: Container(
                            child: Text(
                              "Phone : ${widget.phone.toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                "Order Address : ",
                style: AppWidget.bigboldTextBlack(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 14, left: 14, top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Items :",
                              style: AppWidget.carttitle(),
                            ),
                            Text(
                              "Rs.${(widget.price - (widget.price / 100 * 5)).toStringAsFixed(2).toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 14, left: 14, top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Packing :",
                              style: AppWidget.carttitle(),
                            ),
                            Text(
                              "Rs.${((widget.price / 100 * 5)).toStringAsFixed(2).toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 14, left: 14, top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total :",
                              style: AppWidget.carttitle(),
                            ),
                            Text(
                              "Rs.${(widget.price).toStringAsFixed(2).toUpperCase()}",
                              style: AppWidget.carttitle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
