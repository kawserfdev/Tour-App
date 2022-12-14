import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:toure_app/const/AppColor.dart';
import 'package:toure_app/const/assets.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/style/textStyle.dart';
import '../style/sizeConfig.dart';

class Onbording_Screen extends StatelessWidget {
  List<String> _title = Assets.Onbording_title;
  List<String> _description = Assets.Onbording_description;
  List<String> _lottie = Assets.assetjson;

  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    //size of the window
    SizeConfig().init(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.black,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: AppColor.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 5,
                          spreadRadius: 1.0),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              '${_title[_currentIndex.toInt()]}',
                              style: textStyle.style_sb_20black,
                            ),
                          ),
                          Obx(
                            () => Text('${_description[_currentIndex.toInt()]}',
                                style: textStyle.style_L_20black),
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
                                    size: Size.square(10.0),
                                    activeSize: Size(15.0, 15.0),
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
                                  height: SizeConfig.screenHeight! / 18,
                                  width: SizeConfig.screenWidth! / 18,
                                  decoration: BoxDecoration(
                                      color: AppColor.background,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColor.black,
                                            offset: Offset(3.0, 3.0),
                                            blurRadius: 10,
                                            spreadRadius: 1.0),
                                        BoxShadow(
                                            color: AppColor.white,
                                            offset: Offset(-3.0, -3.0),
                                            blurRadius: 5,
                                            spreadRadius: 1.0),
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
                )),
          ],
        ),
      ),
    );
  }
}
