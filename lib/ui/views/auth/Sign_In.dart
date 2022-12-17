import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toure_app/const/AppColor.dart';
import 'package:toure_app/const/AppString.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/style/textStyle.dart';
import 'package:toure_app/ui/widget/appButton/AppButton.dart';
import 'package:toure_app/ui/widget/textField.dart';

class Sign_In extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.LoginAccountText,
              style: textStyle.style_m_36black,
            ),
          
            SizedBox(
              height: 80,
            ),
            customTextFormField(_emailController, AppString.Email_Address, TextInputType.emailAddress),
            customTextFormField(_passController, AppString.Enter_Password, TextInputType.text),
            SizedBox(height: 40,),
            VioletButton("Login",(){}),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '--OR--',style:textStyle.style_L_15black,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 10 ,
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
                text: AppString.Don_not_have_registered_yet,
                style: textStyle.style_m_17black,
                 children:[
                  TextSpan(
                    text:'Sign Up',style: TextStyle(
                      fontSize: 17,
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