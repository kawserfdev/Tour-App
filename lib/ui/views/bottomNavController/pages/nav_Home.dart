import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toure_app/const/AppString.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/views/tour_details.dart';
import '../../../../const/AppColor.dart';
import '../../../widget/navCategorye.dart';
import '../../seeAll.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _NavHomeState();
}

class _NavHomeState extends State<HomePage> {
  final RxInt _currentIndex = 0.obs;
  //collectionName
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('all-data');

  final CollectionReference _carouselImage =
      FirebaseFirestore.instance.collection('benner_elements');

  //queryName
  late Future<QuerySnapshot> _futureDataForYou;
  late Future<QuerySnapshot> _futureDataRecentlyAdded;
  late Future<QuerySnapshot> _futureDataTopPlaces;

  //carousel-Image
  List<String> _carouselImages = [
    'https://firebasestorage.googleapis.com/v0/b/splash-banking.appspot.com/o/Elements%20of%20tour%20app%2Fdavid-vives-t0b06W6dGyI-unsplash.jpg?alt=media&token=de28095c-051c-4cb0-887f-beb36cdd5055',
    'https://firebasestorage.googleapis.com/v0/b/splash-banking.appspot.com/o/Elements%20of%20tour%20app%2Ferik-karits-sVE1l2zs4lU-unsplash.jpg?alt=media&token=c36da427-83e3-4a8d-9db8-596b72ab5a5b',
    'https://firebasestorage.googleapis.com/v0/b/splash-banking.appspot.com/o/Elements%20of%20tour%20app%2Ffineas-anton-0Ij2Nlt3bzM-unsplash.jpg?alt=media&token=b28b082d-6cd8-447a-bf7c-8536fc30147c'
  ];
  var _dotPosition = 0;
  fetchCarouselImages() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("benner_elements").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img"],
        );
        // print(qn.docs[i]["img"]);
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    _futureDataForYou = _refference.where('for_you', isEqualTo: true).get();
    _futureDataRecentlyAdded =
        _refference.where('recently_added', isEqualTo: true).get();
    _futureDataTopPlaces =
        _refference.where('top_places', isEqualTo: true).get();
    fetchCarouselImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarouselSlider(
                items: _carouselImages
                    .map((item) => Padding(
                          padding:
                              EdgeInsets.only(left: 3.w, right: 3.w, top: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(item),
                                    fit: BoxFit.fill)),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 200.h,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                    onPageChanged: (val, carouselPageChangedReason) {
                      setState(() {
                        _currentIndex.value = val;
                      });
                    })),
            SizedBox(
              height: 5.h,
            ),
            Obx(
              () => DotsIndicator(
                dotsCount:
                    _carouselImages.length == 0 ? 1 : _carouselImages.length,
                position: _currentIndex.value.toDouble(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
              child: InkWell(
                onTap: () => Get.toNamed(searchScreen),
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(
                        width: 0.5,
                        color: AppColor.gray,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_outlined,
                          size: 20.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          AppString.Search_next_tour,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            navHomeCategories(
              "For You",
              () => Get.toNamed(seeAllScreen, arguments: SeeAll('for_you')),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                height: 180.h,
                child: FutureBuilder<QuerySnapshot>(
                    future: _futureDataForYou,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        List<Map> items = parseData(snapshot.data);
                        return forYou(items);
                      }
                      return Center(child: CircularProgressIndicator());
                    })),
            SizedBox(
              height: 15.h,
            ),
            navHomeCategories(
              "Recently Added",
              () => Get.toNamed(seeAllScreen,
                  arguments: SeeAll('recently_added')),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                height: 180.h,
                child: FutureBuilder<QuerySnapshot>(
                    future: _futureDataRecentlyAdded,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        List<Map> items = parseData(snapshot.data);
                        return recentlyAdded(items);
                      }
                      return Center(child: CircularProgressIndicator());
                    })),
            SizedBox(
              height: 15.h,
            ),
            navHomeCategories(
              "Top Places",
              () => Get.toNamed(seeAllScreen, arguments: SeeAll('top_places')),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                height: 80.h,
                child: FutureBuilder<QuerySnapshot>(
                    future: _futureDataTopPlaces,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        List<Map> items = parseData(snapshot.data);
                        return topPlaces(items);
                      }
                      return Center(child: CircularProgressIndicator());
                    })),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> parseData(QuerySnapshot querySnapshot) {
  List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
  List<Map> listItems = listDocs
      .map((e) => {
            'list_images': e['gallery_img'],
            'list_destination': e['destination'],
            'list_cost': e['cost'],
            'list_description': e['description'],
            'list_facilities': e['facilities'],
            'list_owner_name': e['owner_name'],
            'list_phone': e['phone'],
          })
      .toList();
  return listItems;
}

ListView forYou(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(detailstoure, arguments: DetailsSCreen(thisItem)),
          child: Container(
            width: 120.w,
            height: 200.h,
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
                      height: 115.h,
                      fit: BoxFit.cover,
                    )),
                Text(
                  thisItem['list_destination'],
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  thisItem['list_cost'],
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

ListView recentlyAdded(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(detailstoure, arguments: DetailsSCreen(thisItem)),
          child: Container(
            width: 120.w,
            height: 200.h,
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
                      height: 115.h,
                      fit: BoxFit.cover,
                    )),
                Text(
                  thisItem['list_destination'],
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  thisItem['list_cost'],
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

ListView topPlaces(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(detailstoure, arguments: DetailsSCreen(thisItem)),
          child: Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Color(0xFfC4C4C4),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(thisItem['list_images'][0]),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      );
    },
  );
}
