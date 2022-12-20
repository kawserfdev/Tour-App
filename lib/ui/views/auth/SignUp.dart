import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toure_app/bussiness%20logic/auth.dart';
import 'package:toure_app/const/AppColor.dart';
import 'package:toure_app/const/AppString.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/style/textStyle.dart';
import 'package:toure_app/ui/widget/appButton/AppButton.dart';
import 'package:toure_app/ui/widget/textField.dart';

class SignUp extends StatelessWidget {
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
              AppString.Create_Account,
              style: TextStyle(fontSize: 36.sp,fontWeight: FontWeight.w500,color: AppColor.black),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppString.Create_account_start_journey,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 80.h,
            ),
            customTextFormField(_emailController, AppString.Email_Address, TextInputType.emailAddress),
            customTextFormField(_passController, AppString.Enter_Password, TextInputType.text),
            SizedBox(height: 40.h,),
            VioletButton("Create Account",()=>Aouth().signUp(_emailController.text, _passController.text, context)),
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
              IconButton(onPressed: (){}, icon: Image.asset(AppString.google_logo,scale: 2,)),
              IconButton(onPressed: (){}, icon: Image.asset(AppString.facebook_logo,scale: 2,)),
            ],),
            SizedBox(
              height: 20 ,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(text: TextSpan(
                text: AppString.Already_an_user,
                style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w500,color: AppColor.black),
                 children:[
                  TextSpan(
                    text:'log In',style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColor.blue,
                      fontWeight: FontWeight.w600
                    ),
                    recognizer:TapGestureRecognizer()..onTap=()=>Get.toNamed(signIn),
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