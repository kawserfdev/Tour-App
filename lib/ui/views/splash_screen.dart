import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toure_app/const/AppString.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/style/textStyle.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => Get.toNamed(onbording));
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppString.applogo,
            ),
            Text(
              AppString.appname,
              style: textStyle.style_sb_20black,
            )
          ],
        ),
      ),
    );
  }
}
