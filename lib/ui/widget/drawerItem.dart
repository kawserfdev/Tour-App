import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drawerItem(String itemNme,onClick){
  return InkWell(
    onTap:onClick ,
    child: Text(itemNme,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),),
  );
}