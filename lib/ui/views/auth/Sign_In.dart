import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toure_app/const/AppColor.dart';
import 'package:toure_app/const/AppString.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/widget/appButton/AppButton.dart';
import 'package:toure_app/ui/widget/textField.dart';

import '../../../bussiness logic/auth.dart';

class Sign_In extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 80.r, right: 30.r, left: 30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.LoginAccountText,
              style: TextStyle(fontSize: 36.sp,fontWeight: FontWeight.w500,color: AppColor.black),
            ),
          
            SizedBox(
              height: 80.h,
            ),
            customTextFormField(_emailController, AppString.Email_Address, TextInputType.emailAddress),
            customTextFormField(_passController, AppString.Enter_Password, TextInputType.text),
            SizedBox(height: 40.h,),
            VioletButton("Login",()=>Aouth().signIn(_emailController.text, _passController.text, context)),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '--OR--',style:TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w300,color: AppColor.black),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 10.h ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(onPressed: (){}, icon: Image.asset(AppString.google_logo,scale: 1.8.r,)),
              IconButton(onPressed: (){}, icon: Image.asset(AppString.facebook_logo,scale: 1.8.r,)),
            ],),
            SizedBox(
              height: 20.h ,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(text: TextSpan(
                text: AppString.Don_not_have_registered_yet,
                style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                 children:[
                  TextSpan(
                    text:'Sign Up',style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColor.blue,
                      fontWeight: FontWeight.w600
                    ),
                    recognizer:TapGestureRecognizer()..onTap=()=>Get.toNamed(signUp),
                  ),
                  
                 ]
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}