import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/dtails_heading_description.dart';

class DetailsSCreen extends StatefulWidget {
  DetailsSCreen(this.detailsData);
  Map detailsData;

  @override
  State<DetailsSCreen> createState() => _DetailsSCreenState();
}

class _DetailsSCreenState extends State<DetailsSCreen> {
 

  final RxInt _currentIndex = 0.obs;

//add to favourite
   addtoFavourite() async {
    FirebaseFirestore.instance
        .collection('Users-Favourite')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .doc()
        .set(
      {
        'fav-image': widget.detailsData['list_images'][0],
        'fav-destination': widget.detailsData['list_destination'],
        'fa-cost': widget.detailsData['list_cost'],
      },
    ).whenComplete(() {
      Fluttertoast.showToast(
          msg: "Added to favourite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white,
          fontSize: 13.0);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> checkFav(
      BuildContext context) async* {
    yield* FirebaseFirestore.instance
        .collection("Users-Favourite")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .where("fav-image", isEqualTo:  widget.detailsData['list_images'][0])
        .snapshots();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Details"),
        actions: [
           StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: checkFav(context),
              builder: (context, snapshot) {
                if (snapshot.data == null) return Text("");
                return IconButton(
                  icon: snapshot.data!.docs.length == 0
                      ? Icon(
                          Icons.favorite_outline,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  onPressed: () {
                    snapshot.data!.docs.length == 0
                        ? addtoFavourite()
                        : Fluttertoast.showToast(
                            msg: "Already Added",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.deepOrange,
                            textColor: Colors.white,
                            fontSize: 13.0);
                  },
                );
              },
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  AspectRatio(
                      aspectRatio: 3,
                      child: Image.network(
                        widget.detailsData['list_images'][0],
                        fit: BoxFit.cover,
                      )),

                  detailsHeadingDescription(
                      "Description", widget.detailsData['list_description']),
                  detailsHeadingDescription(
                      "Facilities", widget.detailsData['list_facilities']),
                  detailsHeadingDescription(
                      "Destination", widget.detailsData['list_destination']),
                  // detailsHeadingDescription("Journey Date & Time",  widget.detailsData['list_destination']),
                  detailsHeadingDescription(
                      "Cost", widget.detailsData['list_cost']),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.detailsData['list_owner_name'],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                             launchUrl(Uri.parse("tel:${widget.detailsData['list_phone']}"));
                          }, icon: Icon(Icons.call_outlined)),
                      IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse("sms:${widget.detailsData['list_phone']}"));
                          }, icon: Icon(Icons.message_outlined)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}