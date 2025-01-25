import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/bottomNav.dart';
import 'package:get/get.dart';
// import 'package:food_app/pages/HomePage.dart';
// import 'package:food_app/pages/bottomNav.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  loginwithGoogle() async {
    try {
      final googleuser = await GoogleSignIn().signIn();

      var name = googleuser?.displayName.toString();
      var email = googleuser?.email.toString();
      var photoUrl = googleuser?.photoUrl.toString();

      Map<String, dynamic> fdata = {
        "name": name.toString(),
        "email": email.toString(),
        "photoUrl": photoUrl.toString(),
      };

      final googleAuth = await googleuser?.authentication;

      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      FirebaseFirestore.instance
          .collection(email.toString())
          .doc("profile")
          .set(fdata);
      return await FirebaseAuth.instance
          .signInWithCredential(cred)
          .then((value) => (value) {
                if (googleuser?.id != null) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNav()));
                }
              });
    } catch (ex) {
      return print(ex.toString());

      // final issue = SnackBar(content: Text(ex.toString()));

      //  return ScaffoldMessenger.of(context).showSnackBar(issue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.3,
              child: Image.asset(
                "assets/logo/boarding.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 138,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 11,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 15,
                    child: SignInButton(Buttons.google, onPressed: () {
                      loginwithGoogle();
                    }),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
