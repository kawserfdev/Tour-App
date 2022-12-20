import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toure_app/ui/style/textStyle.dart';
import '../../const/AppColor.dart';



Widget customTextFormField(
    controller, String hintText, keyboardType)  {
  return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText, hintStyle: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: AppColor.black)));
}
Widget customTextField(
  controller,
)  {
  return Container(
    height:50.h,
    decoration: BoxDecoration(
        color: AppColor.gray,
        borderRadius: BorderRadius.all(Radius.circular(8.r))),
    child: TextField(
      controller: controller,
    ),
  );
}

Widget textfieldsearch(String hintText, controller)  {
  return Container(
    height: 50.h,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.r))),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          hintText: hintText,
          hintStyle:  TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w300,color: AppColor.black),
          icon: Icon(Icons.search)),
    ),
  );
}

Widget TextFieldMultiline(
  controller,
)  {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(
        color: AppColor.gray,
        borderRadius: BorderRadius.all(Radius.circular(8.r))),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
    ),
  );
}