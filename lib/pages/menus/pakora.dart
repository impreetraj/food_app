import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/menus/food_details.dart';
import 'package:food_app/support/style.dart';

class Pakora extends StatefulWidget {
  const Pakora({super.key});

  @override
  State<Pakora> createState() => _PakoraState();
}

class _PakoraState extends State<Pakora> {
  final List<Map<String, dynamic>> pakora = [
    {
      "id": "FDoakora1",
      "name": "Plain Bread Pakoda",
      "image": "assets/pakora/pakora1.webp",
      "price": 30,
      "discription":
          "Bread Pakora is a much loved snack of deep fried and savory bread fritters from the North Indian Cuisine, especially Punjabi Cuisine."
    },
    {
       "id": "FDoakora2",
      "name": "Chawal Ke Pakoda tasty",
      "image": "assets/pakora/pakora2.webp",
      "price": 50,
      "discription":
          "pakora or fritters is a favorite kind of fried food for us Indians. And then there's rice, which is also quite the staple food in India."
    },
    {
       "id": "FDoakora3",
      "name": "Palak ke pakoda",
      "image": "assets/pakora/pakora3.webp",
      "price": 60,
      "discription":
          "Palak pakoda are crisp and tasty deep-fried spinach fritters made with spinach leaves, gram flour (besan), onion, herbs and spices."
    },
    {
       "id": "FDoakora4",
      "name": "Onion ke Pakoda",
      "image": "assets/pakora/pakora4.jpg",
      "price": 90,
      "discription":
          "Onion Pakoda is a deep fried Indian snack of crispy and tasty onion fritter snack made with gram flour, spices, herbs and lot of onions"
    },
    {
       "id": "FDoakora5",
      "name": "Mirchi Vada pakora",
      "image": "assets/pakora/pakora5.webp",
      "price": 80,
      "discription":
          "Mirchi Vada is one more Indian dish, which has regional variations throughout the length and breadth of India."
    },
    {
       "id": "FDoakora6",
      "name": "Moong Dal Pakoda",
      "image": "assets/pakora/pakora6.webp",
      "price": 60,
      "discription":
          "Moong Dal Pakoda, also known as Moong Dal Bhajiya or Moong Dal Vada is scrumptious snack popularly sold on the streets of Mumbai"
    },
    {
       "id": "FDoakora7",
      "name": "Cauliflower pakoda",
      "image": "assets/pakora/pakora7.webp",
      "price": 40,
      "discription":
          "Though they are many variations to make gobi pakora, this recipe is a truly delicious one."
    },
    {
       "id": "FDoakora8",
      "name": "Kanda Bhaji pakora",
      "image": "assets/pakora/pakora8.webp",
      "price": 100,
      "discription":
          "They make for a good tea time snack served with a side of green chutney or tomato ketchup."
    },
    {
       "id": "FDoakora9",
      "name": "Methi Bhajiya pakora",
      "image": "assets/pakora/pakora9.webp",
      "price": 70,
      "discription":
          "Methi pakoda recipe with step by step photos.made with fenugreek leaves, gram flour (besan), herbs and spices "
    },
    {
       "id": "FDoakora10",
      "name": "Cabbage Pakoda",
      "image": "assets/pakora/pakora10.webp",
      "price": 60,
      "discription":
          "Cabbage Pakoda are crispy fried fritters made with cabbage, onions, gram flour, herbs and spices."
    },
    {
       "id": "FDoakora11",
      "name": "Banana bajji pakora",
      "image": "assets/pakora/pakora11.webp",
      "price": 70,
      "discription":
          "Banana bajji are crisp and tasty fritters made with unripe bananas or plantains. "
    },
    {
       "id": "FDoakora12",
      "name": "Crispy Mix Veg Pakora",
      "image": "assets/pakora/pakora12.webp",
      "price": 75,
      "discription":
          "this veg pakora has a crispy, crunchy exterior with a soft interior. The recipe is naturally vegan and can be made gluten-free."
    },
    {
       "id": "FDoakora13",
      "name": "Zucchini Fritters pakora",
      "image": "assets/pakora/pakora13.webp",
      "price": 90,
      "discription":
          "Crispy on the outside, soft and tender on the inside, and bursting with the flavors of summer"
    },
    {
       "id": "FDoakora14",
      "name": "Brinjal pakora",
      "image": "assets/pakora/pakora2.webp",
      "price": 50,
      "discription":
          "Brinjal pakora is an easy and tasty snack of fried, crisp fritters made with gram flour, brinjals, herbs, and spices."
    },
  ];

  List<Map<String, dynamic>> dummyList = [];

  @override
  void initState() {
    dummyList = pakora;
    super.initState();
  }

  List<Map<String, dynamic>> results = [];

  void runfile(String key) {
    if (key.isEmpty) {
      results = pakora;
    } else {
      results = pakora
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(key.toLowerCase()))
          .toList();
    }
  setState(() {
      dummyList = results;
    });
  }

  TextEditingController searchController = TextEditingController();
  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: search
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: "Search....",
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (value) {
                    runfile(value);
                  },
                ),
              )
            : Text(
                "Pakora",
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
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            "Feeling like a cakewal? Explore \n   our amazing range of cakes!",
            style: AppWidget.menuTitle(),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: dummyList.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: MediaQuery.of(context).size.height/2.8,
                      ),
                      padding: EdgeInsets.all(20),
                      itemCount: dummyList.length,
                      itemBuilder: (_, index) {
                        return Container(
                          

                            //   showModalBottomSheet(
                            //       context: context,
                            //       builder: (context) => Column(
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: [
                            //               Padding(
                            //                 padding: const EdgeInsets.all(9.0),
                            //                 child: ClipRRect(
                            //                   borderRadius:
                            //                       BorderRadius.circular(22),
                            //                   child: Image.asset(
                            //                     dummyList.elementAt(index)['image'],
                            //                     width: MediaQuery.of(context)
                            //                             .size
                            //                             .width /
                            //                         1.9,
                            //                     height: 210,
                            //                   ),
                            //                 ),
                            //               ),
                            //               // SizedBox(height: 10,),
                            //               Container(
                            //                   child: Text(
                            //                 dummyList
                            //                     .elementAt(index)['name']
                            //                     .toString(),
                            //                 style: AppWidget.bigboldTextBlack(),
                            //               )),
                            //               Padding(
                            //                 padding: const EdgeInsets.all(10.0),
                            //                 child: Text(
                            //                   dummyList
                            //                       .elementAt(
                            //                           index)['description']
                            //                       .toString(),
                            //                   style: AppWidget.menuPrice(),
                            //                 ),
                            //               )
                            //             ],
                            //           ));
                          
                          child: SingleChildScrollView(
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                            var name = dummyList
                                                .elementAt(index)['name']
                                                .toString();
                                            var image = dummyList
                                                .elementAt(index)['image'];
                                            var price = dummyList
                                                .elementAt(index)['price']
                                                ;
                                            var discption = dummyList
                                                .elementAt(index)['discription']
                                                .toString();
                                                
                                                var id = dummyList
                                                .elementAt(index)['id']
                                                .toString();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      foodDetail(
                                                    name: name,
                                                    image: image,
                                                    disp: discption,
                                                    price: price,
                                                    id: id,
                                                  ),
                                                ));},
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          dummyList.elementAt(index)['image'],
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      dummyList
                                          .elementAt(index)["name"]
                                          .toString(),
                                      style: AppWidget.menuName(),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Rs. ${dummyList.elementAt(index)['price']}.00",
                                      style: AppWidget.menuPrice(),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                     ElevatedButton(
                                          onPressed: () {
                                            String value = '';
                                            var currentUser =
                                                FirebaseAuth.instance.currentUser;
                                            if (currentUser != null) {
                                              value =
                                                  currentUser.email.toString();
                                            }
                                            funCart() {
                                              var User = FirebaseFirestore
                                                  .instance
                                                  .collection(value + 'cart')
                                                  .doc()
                                                  .id;
                          
                                              return User;
                                            }
                          
                                            Map<String, dynamic> fdata = {
                                              "name": dummyList
                                                  .elementAt(index)['name']
                                                  .toString(),
                                              "price": dummyList
                                                  .elementAt(index)['price'],
                                              "finalPrice": dummyList
                                                  .elementAt(index)['price'],
                                              "image": dummyList
                                                  .elementAt(index)['image']
                                                  .toString(),
                                              "number": 1,
                                              "Id": dummyList
                                                  .elementAt(index)['id']
                                                  .toString(),
                                              "uid": funCart().toString(),
                                              "discription": dummyList
                                                  .elementAt(index)['discription']
                                                  .toString(),
                                            };
                          
                                            FirebaseFirestore.instance
                                                .collection(value + 'cart')
                                                .doc(fdata['uid'])
                                                .set(fdata);
                                          },
                                          child: Text("Add to cart"),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.orange),
                                        )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Text(
                      "Not found",
                      style: AppWidget.boldTextBlack(),
                    )),
        ],
      ),
    );
  }
}
