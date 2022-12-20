import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:toure_app/const/AppColor.dart';
import 'package:toure_app/const/assets.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/style/textStyle.dart';
class Onbording_Screen extends StatelessWidget {
  List<String> _title = Assets.Onbording_title;
  List<String> _description = Assets.Onbording_description;
  List<String> _lottie = Assets.assetjson;

  RxInt _currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    //size of the window

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.r),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                  flex: 2, child: Lottie.asset(_lottie[_currentIndex.toInt()])),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColor.background,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.black,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10.r,
                          spreadRadius: 1.0.r),
                      BoxShadow(
                          color: AppColor.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 5.r,
                          spreadRadius: 1.0.r),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(30.r),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              '${_title[_currentIndex.toInt()]}',
                              style:  TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w800,color: AppColor.black),
                            ),
                          ),
                          Obx(
                            () => Text('${_description[_currentIndex.toInt()]}',
                                style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300,color: AppColor.black)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => DotsIndicator(
                                  dotsCount: _lottie.length,
                                  position: _currentIndex.toDouble(),
                                  decorator: DotsDecorator(
                                    color: AppColor.gray,
                                    activeColor: AppColor.black,
                                    size: Size.square(10.0.r),
                                    activeSize: Size(15.0.r, 15.0.r),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (_currentIndex == 2) {
                                    Get.toNamed(signUp);
                                  } else {
                                    _currentIndex + 1;
                                  }
                                },
                                child: Container(
                                  height:35.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                      color: AppColor.background,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColor.black,
                                            offset: Offset(3.0, 3.0),
                                            blurRadius: 10.r,
                                            spreadRadius: 1.0.r),
                                        BoxShadow(
                                            color: AppColor.white,
                                            offset: Offset(-3.0, -3.0),
                                            blurRadius: 5.r,
                                            spreadRadius: 1.0.r),
                                      ]),
                                  child: Icon(
                                    Icons.double_arrow,
                                    color: AppColor.black,
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                ),
          ],
        ),
      ),
    );
  }
}
