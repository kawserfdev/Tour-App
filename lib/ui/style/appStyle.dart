import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  TextStyle myTextStyle = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black);
  TextStyle myTextStyle20 = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 20.sp, color: Colors.black);

  InputDecoration textFieldDecoration(String hint, Icon icon) =>
      InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 15.sp,
        ),
      );

  progressDialog(context) => showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Processing"),
              ],
            ),
          ),
        ),
      );
}