import 'package:flutter/material.dart';
import 'package:toure_app/const/AppColor.dart';
import 'package:toure_app/ui/widget/appButton/AppButton.dart';

class Privacy_Policy extends StatelessWidget {
  const Privacy_Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(color: AppColor.gray,)),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 30,right: 30),
            child: VioletButton('Agree', (){}),
          )
        ],
      ),
    );
  }
}