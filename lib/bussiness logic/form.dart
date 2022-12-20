import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:toure_app/ui/route/route.dart';

class UsersInfo {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  sendFormDatatoDB(
    String name, int phone,String address, String dob,String gender 
  )async{
    try {
      CollectionReference _account=
      FirebaseFirestore.instance.collection("users-form-data");
      _account.doc(_auth.currentUser!.email).set({
        'name':name,
        'phone':phone,
        'address':address,
        'dob':dob,
        'gender':gender
      }).whenComplete(() {
        Fluttertoast.showToast(msg: "Added Successfully");
        Get.toNamed(privacyPolicy);
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "error$e");
    }
  }
}