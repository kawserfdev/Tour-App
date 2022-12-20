import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toure_app/const/AppString.dart';
import 'package:toure_app/ui/route/route.dart';
import '../../const/AppColor.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
final box=GetStorage();

Future chooseScreen()async{
  var userId=box.read('uid');
  if (userId==null) {
    Get.toNamed(main_homeScreen);
  }else{
    Get.toNamed(main_homeScreen);
  }
}

@override
  void initState() {
     Future.delayed(Duration(seconds: 3), () => chooseScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
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
              style:  TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w800,color: AppColor.black),
            )
          ],
        ),
      ),
    );
  }
}
