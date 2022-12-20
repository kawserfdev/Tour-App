import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('Users-Favourite')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("items")
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;
                return Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        final data = docs[i].data();
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              onTap: () {
                              //  Get.to(DetailsScreen(data));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        data['fav-image'],
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 25,
                              child: CircleAvatar(
                                child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        FirebaseFirestore.instance
                                            .collection("Users-Favourite")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.email)
                                            .collection("items")
                                            .doc(snapshot.data!.docs[i].id)
                                            .delete();
                                      });
                                    }),
                              ),
                            )
                          ],
                        );
                      }),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
    );
  }
}