

import 'package:flutter/material.dart';
import 'package:food_app/pages/menus/food_details.dart';
import 'package:food_app/support/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string_generator/random_string_generator.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}



class _RestaurantState extends State<Restaurant> {
  var generator = RandomStringGenerator( fixedLength: 10, );
  final List<Map<String, dynamic>> Restaurant = [
     {
      "id": "FDdosa3",
      "name": "jini dosa recipe ",
      "image": "assets/dosa/dosa3.webp",
      "price": 150,
      "discription":
          " jini roll dosa with detailed photo and video recipe. a fusion recipe between the popular south indian cuisine with the popular street food of mumbai."
    },
    {
      "id": "FDchowmein8",
      "name": "Singapore Noodles",
      "image": "assets/chowmein/chow8.webp",
      "price": 170,
      "discription":
          "The hot spicy flavor is given by the authentic curry powder used. They are usually only eaten with vegetables but beef, chicken, scrambled eggs, and prawns to enhance the taste."
    },
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
      "id": "FDcutlet8",
      "name": "Poha cutlet, No onion",
      "description":
          "Since I make my own bread these days, weekly once I bake it. I trim the crust from all the sides and it makes really good bread crumbs. Though at times I have it as such (fresh crust is really tasty hehe) or with my morning milk, I collect the rest and dry to powder it. I had a full bottle of bread crumbs to try another patty.",
      "price": 220,
      "image": "assets/cutlets/image8.png"
    },
    {
      "id": "FDcutlet9",
      "name": "Dahi Ke Kabab  ",
      "description":
          "An extremely simple and creamy cutlet patties recipe prepared with yoghurt and crumbled paneer. it is an excellent party starter or appetiser snack recipe which has a crisp and flaky texture on the outside and is moist and creamy on the inside. it is typically served with a spicy green or mint chutney but can also be served as it is without any particular sides to it.",
      "price": 180,
      "image": "assets/cutlets/image9.png"
    },
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
      "id": "FDcutlet10",
      "name": "Veg Kofta in Palak gravy",
      "description":
          "Veg kofta in palak gravy is an exciting way to include greens in your diet, kids will love this and so do the others in family. Kofta in anything tempts me a lot. Name, look, taste, everything tempts me.",
      "price": 240,
      "image": "assets/cutlets/image10.png"
    },
    {
      "id": "FDcutlet11",
      "name": "Moong Dal Vada (Pakoda)",
      "description":
          "Moong dal vada, a quick and tasty vegetarian Indian snack is one of the famous street foods in Gujarat which is usually served with tea or coffee during cold rainy days. It is also known as moong dal pakoda and moong dal bhajiya in different parts of India.",
      "price": 160,
      "image": "assets/cutlets/image11.png"
    },
    {
      "id": "FDcutlet12",
      "name": "Chaat and Tikki",
      "description":
          "Vegetable Cutlet, a delectable combination of mashed potato and green vegetables, is a crisp outside and soft inside Indian potato snack. This stomach filling, mild spicy and crispy Indian cutlet tastes irresistibly delicious when served with assortment of spicy, sweet and sour dips/chutneys like green mint chutney and tamarind chutney, etc.",
      "price": 260,
      "image": "assets/cutlets/image12.png"
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
      "id": "FDchaat8",
      "name": "Palak patta chaat",
      "image": "assets/chaat/chaat8.JPG",
      "price": 70,
      "discription":
          "Palak patta chaat aka palak chaat recipe is an exemplary recipe for chaat which is also renowned as one of the popular delhi street food"
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
      "id": "FDcutlet1",
      "name": "Bread Vegetable Cutlet",
      "description":
          "Bread is a must have ingredient in my home. I always have a stock of them either in my fridge or in my freezer. And this recipe is one of the thing which i made so often before. It is so easy to put together, you just need few bread slices and few veggies. I have even made them without veggies just with sauted onions and spice powders.",
      "price": 250,
      "image": "assets/cutlets/image1.png"
    },
    {
      "id": "FDcutlet2",
      "name": "Seekh Kebab",
      "description":
          "This is one recipe which i wanted to try for so long. I love the look of it and it just makes me want to take one and grab a bite of it. I made this today and it turned out so juicy and moist. Loved the spices going on this and it is truly yummy.",
      "price": 340,
      "image": "assets/cutlets/image2.png"
    },
    {
      "id": "FDcutlet3",
      "name": "Mutton Shami Kebab",
      "description":
          "Shami kebab is one dish which i wanted to try for quite a long time. When i looked over in google i came across lots of recipes. But nothing gave me satisfaction untill i saw sanjeev kapoors recipe. It looked quite easy to try as well. So i tried it and loved it to the core.",
      "price": 380,
      "image": "assets/cutlets/image3.png"
    },
    {
      "id": "FDcutlet4",
      "name": "Murgh Malai Kebab Recipe",
      "description":
          "This kabab is so juicy and very mild so i am sure kids will love it for sure. This is great for parties. Marinate the chicken the day before and grill it just before serving. It will hit the spot for sure.",
      "price": 260,
      "image": "assets/cutlets/image4.png"
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
      "id": "FDdosa7",
      "name": "Schezwan Masala Dosa",
      "image": "assets/dosa/dosa7.jpg",
      "price": 100,
      "discription":
          "Schezwan food, also known as Szechwan cuisine or Sichuan cuisine, is a Chinese cuisine type that originated in Sichuan Province."
    },
    {
      "id": "FDcutlet5",
      "name": "Easy Chicken Mince Kebab",
      "description":
          "I have been getting lots of mails from viewers asking me to post kebab recipe. I was thinking about that too, even though i love kebab a lot, i haven't made them much at home and posted it here as well. So i finally decided to try variety of kebab and share here.",
      "price": 300,
      "image": "assets/cutlets/image5.png"
    },
    {
      "id": "FDchaat9",
      "name": "Ragda chaat",
      "image": "assets/chaat/chaat9.JPG",
      "price": 50,
      "discription":
          "Ragda recipe is one of the most important components of many Indian street food. It is a thick spicy gravy which is the heart of many chaat recipe Indian."
    },
    {
      "id": "FDchaat10",
      "name": "Ragda pattice chaat",
      "image": "assets/chaat/chaat10.jpg",
      "price": 70,
      "discription":
          "Ragda pattice recipe aka ragda patties recipe is a lip smacking chaat recipe which is crazily popular in the subcontinents of northern and western India, "
    },
     {
      "id": "FDcutlet6",
      "name": "Tangdi Kabab Recipe",
      "description":
          "Simple Tangdi kabab, it is new to me. I was not familiar with that until a viewer requested it. Then i searched online and got an idea about the recipe. I love roasting chicken in oven, since it is less fatty when compared to fried ones and it turn out so juicy.",
      "price": 350,
      "image": "assets/cutlets/image6.png"
    },
    {
      "id": "FDcutlet7",
      "name": "Hara Bhara Kabab",
      "description":
          "This is one kabab which i wanted to make for so long, whenever i have spinach on hand i run out of peas and when i have peas, i just have no spinach on hand. Finally one day i had both ingredients on hand and immediately with no delay i made it. I serve it for lunch and it was delicious.",
      "price": 300,
      "image": "assets/cutlets/image7.png"
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
      "id": "FDchaat1",
      "name": "Aloo chanay ki chaat",
      "image": "assets/chaat/chaat1.jpg",
      "price": 70,
      "discription":
          "Aloo chana chaat recipe aka aloo chole chaat recipe is a healthy lip smacking chaat recipe Indian. It is spicy, full of refreshing flavours and easy to make. "
    },
     {
      "id": "FDchowmein5",
      "name": "Drunken Noodles",
      "image": "assets/chowmein/chow5.webp",
      "price":170,
      "discription":
          "Drunken Noodle is a Thai dish which is influenced by Chinese cuisine. It is also known as Phat Khi Mo which means drunkard. The taste is unique as compared to other noodles."
    },
    {
      "id": "FDchowmein6",
      "name": "Liangpi chowmein recipe",
      "image": "assets/chowmein/chow6.webp",
      "price": 150,
      "discription":
          " It is so rich in flavor that contains flavors like sweet, sour, nutty, crispy, tangy, and spicy. The ingredients like chili oil, garlic, and black vinegar enhance the taste of these noodles."
    },
    {
      "id": "FDchowmein7",
      "name": "Calamari Lemon Noodles",
      "image": "assets/chowmein/chow7.webp",
      "price": 120,
      "discription":
          "Calamari Lemon Noodles are simple Chinese noodles with soup served with steamed or fried calamari which is famous seafood."
    },
    {
      "id": "FDchaat2",
      "name": "Aloo dahi chaat ",
      "image": "assets/chaat/chaat2.jpg",
      "price": 75,
      "discription":
          "Aloo dahi chaat is one of the most desired Indian street food It is one of the simplest chaat recipes with amazing flavours and irresistible taste."
    },
    {
      "id": "FDchaat3",
      "name": "Aloo tikki chaat ",
      "image": "assets/chaat/chaat3.jpg",
      "price": 75,
      "discription":
          "Aloo tikki chaat recipe aka alu tikki chaat is a luscious chaat recipe  It is spicy, sweet & tangy, full of refreshing flavours and easy to make snack recipe."
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
      "id": "FDchaat4",
      "name": "Aloo Chaat recipe ",
      "image": "assets/chaat/chaat4.JPG",
      "price": 70,
      "discription":
          "Aloo Chaat recipe is one of the most simple and easiest Indian street food recipes which is immensely famous in India. "
    },
    {
      "id": "FDchaat5",
      "name": "leftover dhokla chaat",
      "image": "assets/chaat/chaat5.jpg",
      "price": 100,
      "discription":
          "Dhokla chaat is a very simple and refreshing fusion chaat recipe Indian.This salivating preparation is mostly relished as evening snack . "
    },
     {
      "id": "FDmakhani12",
      "name": "Dal Bukhara Recipe",
      "image": "assets/makhani/dal12.jpg",
      "price": 110,
      "discription":
          "Dal Bukhara is a classic Punjabi style curry made from whole black urad dal which is creamy and melts in the mouth."
    },
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
      "id": "FDchowmein1",
      "name": "Chicken Chow Mein",
      "image": "assets/chowmein/chow1.webp",
      "price":200,
      "discription":
          "Chicken Chow mein is a popular variety of Chow mein made from wheat noodles. The crunchiness of vegetables like onions, cabbage, carrots, and bell peppers along with tender bits of chicken makes this dish delicious."
    },
    {
      "id": "FDchowmein2",
      "name": "Pan Fried Noodles",
      "image": "assets/chowmein/chow2.webp",
      "price": 100,
      "discription":
          "Pan Fried Noodles are noodles that are made from flour. They are first boiled and then stirred until crispy. The gravy of meat, vegetables, and seafood are used to top these crispy noodles."
    },

    {
      "id": "FDchowmein3",
      "name": "Sichuan Noodles",
      "image": "assets/chowmein/chow3.webp",
      "price":120,
      "discription":
          "These noodles are stir-fried with ginger and garlic paste, flower peppers which is the most important and signature in Sichuan cuisine, and chilies."
    },
    {
      "id": "FDchowmein4",
      "name": "Noodles with Meat Sauce",
      "image": "assets/chowmein/chow4.webp",
      "price": 130,
      "discription":
          "Meat broth and pork are the main ingredients of this dish. The pork is shredded along with shallots, onions, chinese mushrooms, soy sauce, brown sugar, and spice powder."
    },
    {
      "id": "FDchaat6",
      "name": "Chana chaat recipe",
      "image": "assets/chaat/chaat6.JPG",
      "price": 90,
      "discription":
          "Chana chaat recipe aka chole chaat recipe is a healthy and refreshing chaat recipe Indian. It is hugely popular in the subcontinents of south Asia. "
    },
    {
      "id": "FDchaat7",
      "name": "Crispy papdi chaat",
      "image": "assets/chaat/chaat7.JPG",
      "price": 60,
      "discription":
          "Papdi Chaat recipe is one of the most lip-smacking recipes for chaat which is immensely famous in every street and corner of India. "
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
      "id": "FDcake11",
      "name": "Choco Xcess (1 kg)",
      "description":
          "NOTE: Design and icing of cake may vary from the image shown here since each chef has his/her own way of baking and designing a cake.",
      "price": 1100,
      "image": "assets/cake/cake11.webp"
    },
     {
      "id": "FDchowmein8",
      "name": "Singapore Noodles",
      "image": "assets/chowmein/chow8.webp",
      "price": 170,
      "discription":
          "The hot spicy flavor is given by the authentic curry powder used. They are usually only eaten with vegetables but beef, chicken, scrambled eggs, and prawns to enhance the taste."
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
    {
      "id": "FDchowmein9",
      "name": "Noodle Salad chowmein",
      "image": "assets/chowmein/chow9.webp",
      "price": 140,
      "discription":
          "The noodles are garnished with soy sauce, fish sauce, peanut butter, and dressed with sesame oil."
    },
    {
      "id": "FDchowmein10",
      "name": "Stir-Fry Chicken Noodles",
      "image": "assets/chowmein/chow10.webp",
      "price":220,
      "discription":
          "In China, they are served in many dumpling houses and restaurants. These are stir-fried with vegetables and served with beef or chicken cutlets. "
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
      "id": "FDchowmein11",
      "name": "Paneer Noodles",
      "image": "assets/chowmein/chow11.webp",
      "price":200,
      "discription":
          "Addition of paneer makes it a healthy dish as it contains an adequate amount of protein required by the body. They also have vegetables like cabbage, bell peppers, and onion."
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
    dummyList = Restaurant;
    super.initState();
  }

  List<Map<String, dynamic>> resultss = [];

  void runfile(String key) {
    if (key.isEmpty) {
      resultss = Restaurant;
    } else {
      resultss = Restaurant
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
          automaticallyImplyLeading: false,
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
                  "Restaurant",
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
                                            "Id": dummyList
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
