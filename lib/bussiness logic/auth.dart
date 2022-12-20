// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:toure_app/ui/route/route.dart';

// class Aouth_Helper {
//   final box = GetStorage();

//   Future signUp(email, password, context) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);

//       var authCredential = userCredential.user;
//       print(authCredential);
//       if (authCredential!.uid.isNotEmpty) {
//         box.write('id', authCredential.uid);
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) {}));
//       } else {
//         Fluttertoast.showToast(
//             msg: "Sign Up Failed",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         Fluttertoast.showToast(
//             msg: "weak-password",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       } else if (e.code == 'email-already-in-use') {
//         Fluttertoast.showToast(
//             msg: "email-already-in-use",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     }
//   }

//   Future signIn(email, password, context) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);

//       var authCredential = userCredential.user;
//       print(authCredential);
//       if (authCredential!.uid.isNotEmpty) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) {}));
//       } else {
//         Fluttertoast.showToast(
//             msg: "Sign Up Failed",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         Fluttertoast.showToast(
//             msg: "weak-password",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       } else if (e.code == 'email-already-in-use') {
//         Fluttertoast.showToast(
//             msg: "email-already-in-use",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       }
//     }
//   }

//   Future signOut() async {
//     try {
//       var _auth;
//       return _auth.signOut();
//     } catch (error) {
//       print(error.toString());
//       return null;
//     }
//   }

//   Future signInWithGoogle(context) async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     UserCredential _userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     User? _user = _userCredential.user;

//     if (_user!.uid.isNotEmpty) {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => bottomNavController()));
//     } else {
//       Fluttertoast.showToast(
//           msg: "Something is wrong",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//   }

//   FirebaseAuth auth = FirebaseAuth.instance;
//   TextEditingController _otpController = TextEditingController();
//   phoneAuth(number, context) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: number,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         UserCredential _userCredential =
//             await auth.signInWithCredential(credential);
//         User? _user = _userCredential.user;
//         if (_user!.uid.isNotEmpty) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => Get.toNamed(bottomNavController)));
//         } else {
//           Fluttertoast.showToast(
//               msg: "Failed",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               fontSize: 16.0);
//         }
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         if (e.code == 'invalid-phone-number') {
//           Fluttertoast.showToast(
//               msg: "The provided phone number is not valid",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               fontSize: 16.0);
//         }
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         showDialog(
//             context: context,
//             builder: (_) {
//               return AlertDialog(
//                 title: Text('enter your OTP'),
//                 content: Column(children: [
//                   TextField(
//                     controller: _otpController,
//                   ),
//                   ElevatedButton(
//                       onPressed: () async {
//                         PhoneAuthCredential _phoneAuthCredential =
//                             PhoneAuthProvider.credential(
//                                 verificationId: verificationId,
//                                 smsCode: _otpController.text);
//                         UserCredential _userCredential = await auth
//                             .signInWithCredential(_phoneAuthCredential);
//                         User? _user = _userCredential.user;
//                         if (_user!.uid.isNotEmpty) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => bottomNavController));
//                         } else {
//                           Fluttertoast.showToast(
//                               msg: "Failed",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.BOTTOM,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0);
//                         }
//                       },
//                       child: Text('Submite'))
//                 ]),
//               );
//             });
//       },
//       timeout: Duration(seconds: 60),
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
// }