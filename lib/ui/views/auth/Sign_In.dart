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
import '../../style/appStyle.dart';

class Sign_In extends StatefulWidget {
  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  bool value = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 80.r, right: 30.r, left: 30.r),
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.LoginAccountText,
                style: TextStyle(fontSize: 36.sp,fontWeight: FontWeight.w500,color: AppColor.blue),
              ),
            
              SizedBox(
                height: 80.h,
              ),
              TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        // reg expression for email validation
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _emailController.text = value!;
                      },
                      decoration: AppStyles().textFieldDecoration(
                          "E-mail", Icon(Icons.email_outlined))),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: _passController,
                    obscureText: value,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Password is required for login");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Password(Min. 6 Character)");
                      }
                    },
                    onSaved: (value) {
                      _passController.text = value!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              value = !value;
                            });
                          },
                          icon: value == true
                              ? Icon(Icons.remove_red_eye, size: 25.sp)
                              : Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 25.sp,
                                )),
                      prefixIcon: Icon(Icons.lock_outline, size: 25.sp),
                      hintText: "Password",
                    ),
                  ),
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
      ),
    );
  }
}