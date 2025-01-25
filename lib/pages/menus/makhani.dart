import 'package:flutter/material.dart';
import 'package:food_app/support/style.dart';

class Makhani extends StatefulWidget {
  const Makhani({super.key});

  @override
  State<Makhani> createState() => _MakhaniState();
}

class _MakhaniState extends State<Makhani> {
  final List<Map<String, dynamic>> makhani = [
    {
      "id": "FDmakhani1",
      "name": "Tuvar Ni Dal Recipe",
      "image": "assets/makhani/dal1.jpg",
      "price": 100,
      "discription":
          "Tuvar Ni Dal Recipe is toor dal made Parsi style where a freshly ground masala is used to make this masaledar spicy dal."
    },
    {
      "id": "FDmakhani2",
      "name": "Punjabi Toor Dal Tadka",
      "image": "assets/makhani/dal2.jpg",
      "price": 120,
      "discription":
          "A tempering of ghee,cumin, garlic and cinnamon adds to the flavour of the dal . Serve it with rice or roti for a comforting meal."
    },
    {
      "id": "FDmakhani3",
      "name": "Gujarati Dal Recipe",
      "image": "assets/makhani/dal3.jpg",
      "price": 70,
      "discription":
          "A classic sweet , spicy and tangy Gujarati Dal that is super simple to make and lip smacking delicious to eat along with phulka and shaak"
    },
    {
      "id": "FDmakhani4",
      "name": "Drumstick Dal Recipe",
      "image": "assets/makhani/dal4.jpg",
      "price": 100,
      "discription":
          "Here is a wholesome and rich toor dal cooked along with drumstick and subtle spices and tadka to give it a great taste."
    },
    {
      "id": "FDmakhani5",
      "name": "Dill Leaves Toor Dal ",
      "image": "assets/makhani/dal5.jpg",
      "price": 120,
      "discription":
          "The Dill Leaves Toor Dal Recipe is an everyday dal that is cooked with toor dal and flavoured with dill leaves."
    },
    {
      "id": "FDmakhani6",
      "name": "Pahari Style Phanu",
      "image": "assets/makhani/dal6.jpg",
      "price": 100,
      "discription":
          "The Phanu Recipe is a delicious blend of toor dal and urad dal that creates a wonderful dish "
    },
    {
      "id": "FDmakhani7",
      "name": "Moong Phali Ki Dal",
      "image": "assets/makhani/dal7.jpg",
      "price": 120,
      "discription":
          "Masoor Moong Phali Ki Dal Recipe (Masoor Dal With Peanuts Recipe), delicious and rich dal made with a blend of peanuts and Massor."
    },
    {
      "id": "FDmakhani8",
      "name": "Mixed Vegetable Poricha",
      "image": "assets/makhani/dal8.jpg",
      "price": 100,
      "discription":
          "Mixed Vegetable Poricha Kootu is a delicious preparation of the steamed vegetables that is cooked in a coconut and lentil curry. "
    },
    {
      "id": "FDmakhani9",
      "name": "Masoor Dal Makhni",
      "image": "assets/makhani/dal9.jpg",
      "price": 120,
      "discription":
          "Masoor Dal Makhni is a delicious, creamy and healthy lentil recipe. Masoor Dal is considered to be very healthy as compared to other lentils."
    },
    {
      "id": "FDmakhani10",
      "name": "Bengali Cholar Dal",
      "image": "assets/makhani/dal10.jpg",
      "price": 80,
      "discription":
          "Delicious lentil dish cooked with Bengal gram or chana dal flavoured with, cloves, cumin, cinnamon and golden fried dry coconut."
    },
    {
      "id": "FDmakhani11",
      "name": "Chana Methi Dal",
      "image": "assets/makhani/dal11.jpg",
      "price": 100,
      "discription":
          "Chana Methi Dal is a delicious lentil curry made with split Bengal Gram lentil and fresh fenugreek leaves."
    },
    {
      "id": "FDmakhani12",
      "name": "Dal Bukhara Recipe",
      "image": "assets/makhani/dal12.jpg",
      "price": 110,
      "discription":
          "Dal Bukhara is a classic Punjabi style curry made from whole black urad dal which is creamy and melts in the mouth."
    },
  ];


  TextEditingController searchController = TextEditingController();
  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: search
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: SearchController(),
                  decoration: InputDecoration(
                      hintText: "Search....",
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              )
            : Text(
                "Makhani",
                style: AppWidget.bigboldTextBlack(),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                search = !search;

                if (!search) {
                  searchController.clear();
                }
              });
            },
            icon: search ? Icon(Icons.close) : Icon(Icons.search),
          )
        ],
      ),
      body: Text("Makhani"),
    );
  }
}
