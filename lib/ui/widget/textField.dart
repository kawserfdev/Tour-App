import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/AppColor.dart';

Widget customTextFormField(controller, String hintText, keyboardType) {
  return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.black)));
}

Widget supportField(title, value) {
  TextEditingController supportDataController =
      TextEditingController(text: value);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
        ),
      ),
      TextField(
        controller: supportDataController,
        readOnly: true,
      ),
      SizedBox(
        height: 20.h,
      ),
    ],
  );
}

Widget customTextField(title, controller, {maxline}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE9EBED),
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
        ),
        child: TextField(
          controller: controller,
          maxLines: maxline,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 20.w),
          ),
        ),
      ),
      SizedBox(
        height: 15.h,
      ),
    ],
  );
}
