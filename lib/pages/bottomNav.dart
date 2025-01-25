import 'package:flutter/material.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:food_app/pages/cart.dart';
import 'package:food_app/pages/login.dart';
import 'package:food_app/pages/menus/cake.dart';
import 'package:food_app/pages/order.dart';
import 'package:food_app/pages/otpscreen.dart';
import 'package:food_app/pages/restaurant.dart';

class BottomNav extends StatefulWidget {
  

 
 

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  List screen = [homePage(), Restaurant(), Cart(), Order()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), label: "Food Item"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Order"),
        ],
      ),
    );
  }
}
