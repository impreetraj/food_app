import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/pages/bottomNav.dart';
import 'package:food_app/support/style.dart';

class deliver extends StatefulWidget {
  const deliver({super.key});

  @override
  State<deliver> createState() => _deliverState();
}

class _deliverState extends State<deliver> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Order Is Successfully !",
            style: AppWidget.bigboldTextBlack(),
          )),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNav(),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 40,
                child: Center(
                  child: Text(
                    "Continue",
                    style: AppWidget.bigboldTextwhite(),
                  ),
                ),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))))
        ],
      ),
    );
  }
}
