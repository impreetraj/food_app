import 'package:flutter/material.dart';

class Dosa extends StatefulWidget {
  const Dosa({super.key});

  @override
  State<Dosa> createState() => _DosaState();
}

class _DosaState extends State<Dosa> {
  final List<Map<String, dynamic>> dosa = [
    {
      "id": "FDdosa1",
      "name": "vegetable masala dosa",
      "image": "assets/dosa/dosa1.jpg",
      "price": 100,
      "discription":
          "Special vegetable masala dosa is inspired from Hot chips restaurant menu that I tasted. A spicy and flavorful stuffing for special treat."
    },
    {
      "id": "FDdosa2",
      "name": "Chicken Masala Dosa",
      "image": "assets/dosa/dosa2.jpg",
      "price": 220,
      "discription":
          "Surely you’ve heard of the Masala Dosa, but have you heard of the Chicken Masala Dosa?! Chicken Masala Dosa / Pancake / Crepe is a South Indian"
    },
    {
      "id": "FDdosa3",
      "name": "jini dosa recipe ",
      "image": "assets/dosa/dosa3.webp",
      "price": 150,
      "discription":
          " jini roll dosa with detailed photo and video recipe. a fusion recipe between the popular south indian cuisine with the popular street food of mumbai."
    },
    {
      "id": "FDdosa4",
      "name": "Khali Dosa Recipe",
      "image": "assets/dosa/dosa4.jpg",
      "price": 120,
      "discription":
          "Dosa is a very popular breakfast in southern part of India. We have so many different varieties of dose, though all looks almost the same but taste and flavor is unique to the variety."
    },
    {
      "id": "FDdosa5",
      "name": "Mixed Millet Dosa",
      "image": "assets/dosa/dosa5.jpg",
      "price": 100,
      "discription":
          "Millet dosa - vegan, gluten-free, nutritious South Indian breakfast usually served with sambar and varieties of chutneys. This crispy dosa without rice makes a healthy and diabetic-friendly breakfast."  


    },
    {
      "id": "FDdosa6",
      "name": "South Indian Pancakes",
      "image": "assets/dosa/dosa6.jpg",
      "price": 180,
      "discription":
          "Delightfully crispy on the outside and chewy in the center, nothing beats a dosa for the best of South Indian street food"
    },
    {
      "id": "FDdosa7",
      "name": "Schezwan Masala Dosa",
      "image": "assets/dosa/dosa7.jpg",
      "price": 100,
      "discription":
          "Schezwan food, also known as Szechwan cuisine or Sichuan cuisine, is a Chinese cuisine type that originated in Sichuan Province."
    },
   
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
