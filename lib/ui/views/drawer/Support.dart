import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/textField.dart';



class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Support"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
       
          children: [
            Text(
              "If you have any problems , please contact us . We are at your service all the time.",
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            Divider(color: Colors.blue,),
            supportField("Phone", "01616738383"),
            supportField("E-mail", "thed9922@gmail.com"),
            supportField("Facebook", "http://facebook.com/shelter"),

          ],
        ),
      ),
    );
  }
}