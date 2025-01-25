import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/bottomNav.dart';
import 'package:food_app/pages/delivery.dart';
import 'package:get/get.dart';


void placeOrder(
    {required BuildContext context,
    required String customerName,
    required String customerCity,
    required String customerPhone,
    required String customerPin,
    required String customerState,
    required String customerAddress}) async {
  String value = "";
  final currentUser = await FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    value = currentUser.email.toString();
  }

  final User = FirebaseAuth.instance.currentUser;
 
 

  if (User != null) {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(value + 'cart').get();

      List<QueryDocumentSnapshot> document = querySnapshot.docs;

      for (var doc in document) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        Map<String, dynamic> buydata = {
          "name": customerName,
          "phone": customerPhone,
          "pin": customerPin,
          "state": customerState,
          "city": customerCity,
          "address": customerAddress,
          "title": data['name'],
          "image": data['image'],
          "disc": data['discription'],
          "quantity": data['number'],
          "price": data['finalPrice'],
          "uid": data['uid'].toString(),
          "Id": data['Id'].toString(),
          "time": DateTime.now()
        };

        // for (var i = 0; i < document.length; i++) {
        await FirebaseFirestore.instance.collection(value + "buy").doc(data["uid"].toString()).
        set(buydata);

        await FirebaseFirestore.instance
            .collection(value + "cart")
            .doc(data['Id'].toString())
            .delete();
        // }
      }
      

      
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => deliver(),
          ));
    } catch (e) {}
  }
}
