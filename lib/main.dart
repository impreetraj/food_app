import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:food_app/pages/bottomNav.dart';
import 'package:food_app/pages/buyNow.dart';
import 'package:food_app/pages/cart.dart';
import 'package:food_app/pages/delivery.dart';
import 'package:food_app/pages/login.dart';
import 'package:food_app/pages/menus/cake.dart';
import 'package:food_app/pages/menus/food_details.dart';
import 'package:food_app/pages/onboard.dart';
import 'package:food_app/pages/otpscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCrSXLmSgrz4hUxh0up3a58e-hzEysYyh0",
        appId: "1:710060519912:android:8a121ffa82606ad501745d",
        messagingSenderId: "710060519912",
        projectId: "food-project-929a8"),
  );

  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          (FirebaseAuth.instance.currentUser != null) ? BottomNav() : onboard(),
      // home: Cart(),
    );
  }
}






































































































































































































































































































































































































































































































































































































































































































































