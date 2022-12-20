import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/views/bottomNavController/pages/nav_addfinal.dart';
import '../../../widget/appButton/AppButton.dart';
import '../../../widget/textField.dart';

class NavAddPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _facilityController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                "If you have any problems, please contact us. We are at your service all the time.",
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              customTextField("Owner Name", _nameController),
              customTextField("Description", _descriptionController),
              customTextField("Cost", _costController),
              customTextField("Facilities", _facilityController, maxline: 4),
              customTextField("Destination", _destinationController),
              VioletButton(
                "Next",
                () => Get.toNamed(
                  navAddLastStep,
                  arguments: NavAddLastStep(
                    name: _nameController.text,
                    description: _descriptionController.text,
                    cost: _costController.text,
                    facility: _facilityController.text,
                    destination: _destinationController.text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}