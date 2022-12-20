import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toure_app/ui/views/tour_details.dart';
import 'bottomNavController/pages/nav_Home.dart';


class SeeAll extends StatefulWidget {
  var compare;
  SeeAll(this.compare);
  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  //collectionName
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('all-data');

  //queryName
  late Future<QuerySnapshot> _futureDataForYou;
  late Future<QuerySnapshot> _futureDataRecentlyAdded;
  late Future<QuerySnapshot> _futureDataTopPlaces;
  @override
  void initState() {
    _futureDataForYou =
        _refference.where(widget.compare, isEqualTo: true).get();
    _futureDataRecentlyAdded =
        _refference.where(widget.compare, isEqualTo: true).get();
    _futureDataTopPlaces =
        _refference.where(widget.compare, isEqualTo: true).get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("See All"),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: _futureDataForYou,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Text("Error");
              }
              if (snapshot.hasData) {
                List<Map> items = parseData(snapshot.data);
                return forYouBuildGridview(items);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}

GridView forYouBuildGridview(List<Map<dynamic, dynamic>> shoppingItems) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    ),
    itemCount: shoppingItems.length,
    itemBuilder: (_, i) {
      Map thisItem = shoppingItems[i];
      return InkWell(
        onTap: () => Get.to(DetailsSCreen(thisItem)),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFfC4C4C4),
            borderRadius: BorderRadius.all(
              Radius.circular(7.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.r),
                    topRight: Radius.circular(7.r),
                  ),
                  child: Image.network(
                    thisItem['list_images'][0],
                    // height: 115.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Text(
                thisItem['list_destination'],
                style: TextStyle(fontSize: 15.sp),
              ),
              Text(
                thisItem['list_cost'],
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      );
    },
  );
}