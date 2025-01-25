// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:food_app/pages/bottomNav.dart';
// import 'package:food_app/support/style.dart';

// class otpScreen extends StatefulWidget {
//   final String verificatonId;
//   final String name;
//   final String email;
//   final String phone;
//   const otpScreen(
//       {Key? key,
//       required this.verificatonId,
//       required this.name,
//       required this.email,
//       required this.phone});

//   @override
//   State<otpScreen> createState() => _otpScreenState();
// }

// class _otpScreenState extends State<otpScreen> {
//   TextEditingController otpcontroller = TextEditingController();

//   void senddetails() {
//     String fname = widget.name;
//     String femail = widget.email;
//     String fphone = widget.phone;

//     Map<String, dynamic> data = {
//       "Name": fname,
//       "Email": femail,
//       "phone": fphone
//     };

//     FirebaseFirestore.instance.collection("+91"+ fphone + "profile").doc("profile").set(data);
//   }

//   void verifyOTP() async {
//     String otp = otpcontroller.text.trim();

//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificatonId, smsCode: otp);
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       if (userCredential.user != null) {
//         // Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNav() ,));
//         Navigator.popUntil(context, (route) => route.isFirst);
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => BottomNav()));
//       }
//     } on FirebaseAuthException catch (ex) {
//       print(ex.code.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Stack(
//         children: [
//           Column(children: [
//             Container(
//               margin: EdgeInsets.only(top: 80),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 2,
//               child: Image.asset(
//                 "assets/logo/verify.jpg",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               height: 7,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 2.58,
//               decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50),
//                       topRight: Radius.circular(50))),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height / 20,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 1.4,
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: otpcontroller,
//                       maxLength: 6,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                           counterText: " ",
//                           filled: true,
//                           hintText: "Enter OTP",
//                           hintStyle: AppWidget.inputboldTextBlack(),
//                           fillColor: Colors.white,
//                           suffixIcon: Icon(Icons.security)),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       verifyOTP();
//                       senddetails();
//                     },
//                     child: Card(
//                       elevation: 5,
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 1.4,
//                         height: 40,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(40)),
//                         child: Center(
//                             child: Text(
//                           "Submit",
//                           style: AppWidget.loginboldTextBlack(),
//                         )),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ]),
//         ],
//       ),
//     );
//   }
// }
