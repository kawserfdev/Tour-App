import 'package:flutter/material.dart';
import 'package:toure_app/const/AppString.dart';
import 'package:toure_app/ui/style/textStyle.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(AppString.Create_Account,style: textStyle.style_m_36black,),
          
        ],
      ),
    );
  }
}

