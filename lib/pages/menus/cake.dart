

import 'package:flutter/material.dart';
import 'package:food_app/pages/menus/food_details.dart';
import 'package:food_app/support/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string_generator/random_string_generator.dart';

class Cake extends StatefulWidget {
  const Cake({super.key});

  @override
  State<Cake> createState() => _CakeState();
}



class _CakeState extends State<Cake> {
  var generator = RandomStringGenerator( fixedLength: 10, );
  final List<Map<String, dynamic>> cake = [
    {
      "id": "FDcake1",
      "name": "Butterscotch Cake (Junior)",
      "description":
          "Crunchy and crackling butterscotch chips covers this beautiful cake as dense vanilla buttercream layers the soft, moist and fluffy vanilla sponge. This creation is made more beautiful with a touch of caramel sauce and white chocolate decoration on the top layer.",
      "price": 280,
      "image": "assets/cake/cake1.webp"
    },
    {
      "id": "FDcake2",
      "name": "Mango Samoa Cake (1 Kg)",
      "description":
          "A perfect delight for mango lovers of all ages. This beautiful mango glaze cake has mango crush and  whipped cream on its layers for you to enjoy. A final layer of smooth and sweet mango glaze and white chocolate garnish makes the entire cake look and taste divine.",
      "price": 320,
      "image": "assets/cake/cake2.webp"
    },
    {
      "id": "FDcake3",
      "name": "Rich Dutch Chocolate Cake",
      "description":
          "Chocolate cake sponge, Chocolate Butter Cream, chocolate ganache, Choco chips, cocoa solid, milk solid, liquid glucose.",
      "price": 265,
      "image": "assets/cake/cake3.webp"
    },
    {
      "id": "FDcake4",
      "name": "White Forest Cake (Eggless)",
      "description":
          "We bring to you the ultimate all-white White Forest Cake to give your taste buds a treat. Simple Eggless vanilla sponge is covered in layers of non dairy vanilla cream and is garnished with white chocolate shavings, and white chocolate disk. The entire gets a touch of colour with bright red and juicy cherries on the top layer",
      "price": 530,
      "image": "assets/cake/cake4.webp"
    },
    {
      "id": "FDcake5",
      "name": "Black Forest Cake (Eggless)",
      "description":
          "NOTE: Design and icing of cake may vary from the image shown here since each chef has his/her own way of baking and designing a cake.",
      "price": 495,
      "image": "assets/cake/cake5.webp"
    },
    {
      "id": "FDcake6",
      "name": "Choco Floral Cake (Eggless)",
      "description":
          "This beautiful eggless cake has everything and is a chocolate lover’s favourite. Here, layers of chocolate sponge are layered with smooth and fluffy chocolate buttercream and surprises of crunchy butterscotch chips. The cake is covered in frosted chocolate ganache and is finally topped with white chocolate decorations.",
      "price": 345,
      "image": "assets/cake/cake6.webp"
    },
    {
      "id": "FDcake7",
      "name": "Dual Forest Heart Cake (1 kg)",
      "description":
          "This beautiful half and half cake gives you the taste of both worlds Also, this half and half looks beautiful with chocolate and vanilla contrasts. The Dual Forest cake is a classic combination of chocolate and vanilla sponge, layered with chocolate and vanilla whipped cream.",
      "price": 900,
      "image": "assets/cake/cake7.webp"
    },
    {
      "id": "FDcake8",
      "name": "Choco Espresso Cake",
      "description":
          "Get a punch of coffee as you take your first bite into this delicious Choco Espresso cake. Made with rich chocolate sponge, coffee powder, chocolate ganache and non dairy whipped cream, this cake has a burst of flavours. However, what really makes this cake really special are the butterscotch chips, and dark chocolate curls that work as the perfect garnish.",
      "price": 450,
      "image": "assets/cake/cake8.webp"
    },
    {
      "id": "FDcake9",
      "name": "Marble Mania Cake (Eggless)",
      "description":
          "Bringing you bigger cakes for the bigger celebrations of life. Our signature Marble Mania Cake now comes in all-new square shape. Same layers of chocolate and red velvet sponge, vanilla and strawberry buttercream topped with a rich chocolate disk and chocolate shards, this cake looks and tastes divine",
      "price": 300,
      "image": "assets/cake/cake9.webp"
    },
    {
      "id": "FDcake10",
      "name": "Marble Mania Cake (Oval)",
      "description":
          "This cake is truly divine. It has layers of moist chocolate sponge, beautiful red velvet sponge, and delicious strawberry and vanilla buttercream, arranged alternatively, as a disk of sinful chocolate ganache and chocolate curls forms the top most layer. This beautiful cake will treat you with a surprise of berries and chocolate every time you take a bite.",
      "price": 185,
      "image": "assets/cake/cake10.webp"
    },
    {
      "id": "FDcake11",
      "name": "Choco Xcess (1 kg)",
      "description":
          "NOTE: Design and icing of cake may vary from the image shown here since each chef has his/her own way of baking and designing a cake.",
      "price": 1100,
      "image": "assets/cake/cake11.webp"
    },
    {
      "id": "FDcake12",
      "name": "Cake - a - Doraemon",
      "description":
          "NOTE: Design and icing of cake may vary from the image shown here since each chef has his/her own way of baking and designing a cake.",
      "price": 1950,
      "image": "assets/cake/cake12.webp"
    },
  ];

  List<Map<String, dynamic>> dummyList = [];

  @override
  void initState() {
    dummyList = cake;
    super.initState();
  }

  List<Map<String, dynamic>> resultss = [];

  void runfile(String key) {
    if (key.isEmpty) {
      resultss = cake;
    } else {
      resultss = cake
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(key.toLowerCase()))
          .toList();
    }

    setState(() {
      dummyList = resultss;
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
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: (value) {
                      runfile(value);
                    },
                  ),
                )
              : Text(
                  "Cake Item",
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
                            mainAxisExtent:
                                MediaQuery.of(context).size.height / 2.8),
                        padding: EdgeInsets.all(20),
                        itemCount: dummyList.length,
                        itemBuilder: (_, index) {
                          return InkWell(
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
                                              .elementAt(index)['price'];
                                          var discption = dummyList
                                              .elementAt(index)['description']
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
                                              ));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                        "Rs. ${dummyList.elementAt(index)['price']}",
                                        style: AppWidget.menuPrice(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
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
                                            "uid": funCart().toString(),
                                            "id": dummyList
                                                .elementAt(index)['id']
                                                .toString(),
                                            "discription": dummyList
                                                .elementAt(index)['description']
                                                .toString(),
                                          };

                                          DocumentReference documentReference =
                                              await FirebaseFirestore.instance
                                                  .collection(value + 'cart')
                                                  .doc(dummyList
                                                      .elementAt(index)['id']);

                                          DocumentSnapshot snapshot =
                                              await documentReference.get();

                                          if (snapshot.exists) {
                                            final message = SnackBar(
                                              backgroundColor: Colors.orange,
                                                content:
                                                    Text("Product is already exist in cart" , style: AppWidget.cartprice(),));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(message);
                                          }

                                          await documentReference.set(fdata);
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
        ));
  }
}
