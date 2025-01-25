import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/delivery.dart';
import 'package:food_app/support/cartbuyform.dart';
import 'package:food_app/support/style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CbuyForm extends StatefulWidget {
  @override
  State<CbuyForm> createState() => _CbuyFormState();
}

final _formKey = GlobalKey<FormState>();

class _CbuyFormState extends State<CbuyForm> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 1.2, top: 8),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 14,
                          top: 5),
                      child: Text(
                        "BUY FORM",
                        style: AppWidget.bigboldTextBlack(),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Full Name",
                          hintStyle: AppWidget.carttitle(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (name) =>
                          name!.length < 3 ? 'Plaese fill Name correct' : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: phonecontroller,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Phone number",
                          hintStyle: AppWidget.carttitle(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (phone) => phone!.length < 10
                          ? 'Plaese fill correct Number'
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: pincontroller,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Pin Code",
                          hintStyle: AppWidget.carttitle(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (pin) =>
                          pin!.length < 6 ? 'Plaese fill pin ' : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: statecontroller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "State",
                          hintStyle: AppWidget.carttitle(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (state) =>
                          state!.length < 3 ? 'Plaese fill State' : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: citycontroller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "City",
                          hintStyle: AppWidget.carttitle(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (city) =>
                          city!.length < 3 ? 'Plaese fill City' : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: addresscontroller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Full Address",
                          hintStyle: AppWidget.carttitle(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (address) =>
                          address!.length < 3 ? 'Plaese fill Address' : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isChange = true;
                      });
                      String name = namecontroller.text.trim();
                      String phone = phonecontroller.text.trim();
                      String pin = pincontroller.text.trim();
                      String state = statecontroller.text.trim();
                      String city = citycontroller.text.trim();
                      String address = addresscontroller.text.trim();
                      if (name.length < 3 &&
                          phone.length < 10 &&
                          pin.length < 6 &&
                          state.length < 3 &&
                          city.length < 3 &&
                          address.length < 3) {
                        _formKey.currentState!.validate();
                      } else {
                        placeOrder(
                          context: context,
                          customerName: name.toString(),
                          customerPhone: phone.toString(),
                          customerPin: pin.toString(),
                          customerState: state.toString(),
                          customerCity: city.toString(),
                          customerAddress: address.toString(),
                        );
                       
                      }
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 50,
                        child: Center(
                            child:isChange ?CircularProgressIndicator(
                              color: Colors.black,
                            ) : Text(
                          "Submit",
                          style: AppWidget.loginSubmit(),
                        ))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
