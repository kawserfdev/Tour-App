import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toure_app/ui/views/bottomNavController/bottomNavController.dart';
import 'package:toure_app/ui/views/drawer/drawer_screen.dart';

 
class MainHome_Screen extends StatelessWidget {
  Future _exitDialog(context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Are u sure to close this app?'),
        content: Row(
          children: [
            ElevatedButton(onPressed: ()=>SystemNavigator.pop(), child: Text('Yes')),
            SizedBox(width: 20.w,),
             ElevatedButton(onPressed: ()=>Get.back(), child: Text('No')),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
          DrawerScreen(),
          BottomNavController()
        ]),
      ),
    );
  }
}