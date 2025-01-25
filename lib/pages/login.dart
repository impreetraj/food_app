// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:food_app/pages/HomePage.dart';
// import 'package:food_app/pages/otpscreen.dart';
// import 'package:food_app/support/style.dart';

// class loginPage extends StatefulWidget {
//   const loginPage({super.key});

//   @override
//   State<loginPage> createState() => _loginPageState();
// }

// class _loginPageState extends State<loginPage> {
//   TextEditingController phonecontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController namecontroller = TextEditingController();

 

//   void sendotp() async {
//     String phone = "+91" + phonecontroller.text.trim();
//      String name = namecontroller.text.trim();
//     String email = emailcontroller.text.trim();
//     String mobile = phonecontroller.text.trim();

//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phone,
//       codeSent: (verificationId, resendToken) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => otpScreen(
//                 verificatonId: verificationId,
//                 name: name,
//                 email: email,
//                 phone: mobile,

//               ),
//             ));
//       },
//       verificationCompleted: (credential) {},
//       verificationFailed: (ex) {
//         alert(ex.code.toString());
//       },
//       codeAutoRetrievalTimeout: (verficationId) {},
//       timeout: Duration(seconds: 30),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Stack(
//         children: [
//           Container(
//             color: Colors.orange,
//           ),
//           Container(
//             margin: EdgeInsets.only(
//               top: MediaQuery.of(context).size.height / 2.5,
//             ),
//             width: MediaQuery.of(context).size.width / 1,
//             height: MediaQuery.of(context).size.height / 1,
//             // color: const Color.fromARGB(255, 57, 41, 41),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(60.0),
//                     topLeft: Radius.circular(60.0)),
//                 color: Colors.white),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 60, left: 30, right: 30),
//             child: Column(
//               children: [
//                 ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset(
//                       "assets/logo/logo.png",
//                       fit: BoxFit.cover,
//                       width: MediaQuery.of(context).size.width / 1.3,
//                     )),
//                 SizedBox(
//                   height: 65,
//                 ),
//                 Material(
//                   borderRadius: BorderRadius.circular(25),
//                   elevation: 5,
//                   child: Container(
//                     padding: EdgeInsets.only(right: 20, left: 20),
//                     width: MediaQuery.of(context).size.width / 1,
//                     height: MediaQuery.of(context).size.height / 2.5,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: Column(children: [
//                       SizedBox(
//                         height: 13,
//                       ),
//                       Text(
//                         "Login",
//                         style: AppWidget.loginboldTextBlack(),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextField(
//                         controller: namecontroller,
//                         decoration: InputDecoration(
//                             hintText: "Name",
//                             hintStyle: AppWidget.inputboldTextBlack(),
//                             suffixIcon: Icon(Icons.person)),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextField(
//                         controller: emailcontroller,
//                         decoration: InputDecoration(
//                             hintText: "Email",
//                             hintStyle: AppWidget.inputboldTextBlack(),
//                             suffixIcon: Icon(Icons.mail)),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextField(
//                         keyboardType: TextInputType.number,
//                         controller: phonecontroller,
//                         decoration: InputDecoration(
//                             hintText: "Number",
//                             hintStyle: AppWidget.inputboldTextBlack(),
//                             suffixIcon: Icon(Icons.call)),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //       builder: (context) => otpScreen(),
//                           //     ));

//                           sendotp();
                          
//                         },
//                         child: Card(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width / 2.6,
//                             height: 45,
//                             decoration: BoxDecoration(
//                                 color: Colors.orange,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                                 child: Text(
//                               "Login",
//                               style: AppWidget.loginboldTextBlack(),
//                             )),
//                           ),
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// alert(String error) {
//   return AlertDialog(
//     actions: [
//       AboutDialog(
//         children: [Title(color: Colors.red, child: Text(error))],
//       )
//     ],
//   );
// }
