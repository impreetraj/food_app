// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartPriceController extends GetxController {
  RxDouble totalprice = 0.0.obs;
  fun() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser.email;
    }
  }

  @override
  void onInit() {
    fetchcartPrice();
    super.onInit();
  }

  void fetchcartPrice() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection(fun().toString() + "cart").get();
    print(fun().toString());

    double sum = 0.0;

    for (final doc in snapshot.docs) {
      final data = doc.data();
      if (data != null && data.containsKey('finalPrice')) {
        sum += (data['finalPrice'] as num).toDouble();
      }
    }

    totalprice.value = sum;
  }
}
