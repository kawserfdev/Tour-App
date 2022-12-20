import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../style/appStyle.dart';
import '../../widget/appButton/AppButton.dart';

class UserProfile extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;
  String? dob;
  String gender = "Male";
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month} - ${selected.year}";
      _dobController.value.text = dob!;
    }
  }

  update(data) async {
    try {
      CollectionReference registerData =
          FirebaseFirestore.instance.collection("users-form-data");
      final user = FirebaseAuth.instance.currentUser!.email;
      registerData
          .doc(user)
          .update({
            "name": _nameController.text,
            "phone": _phoneController.text,
            "address": _addressController.text,
            "dob": _dobController.value.text,
            "gender": gender,
          })
          .then(
            (value) => Fluttertoast.showToast(
                msg: "Updated Successfully", backgroundColor: Colors.black87),
          )
          .then(
            (value) => Get.back(),
          );
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something is wrong", backgroundColor: Colors.black87);
    }
  }

  setUserData(data, context) {
    _nameController.text = data['name'];
    _phoneController.text = data['phone'].toString();
    _addressController.text = data['address'];
    _dobController.value.text = data['dob'];
    gender = data['gender'];
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormField(_nameController, TextInputType.name, 'name',
                Icon(Icons.person_outline)),
            FormField(_phoneController, TextInputType.number, 'number',
                Icon(Icons.phone_outlined)),
            FormField(_addressController, TextInputType.text, 'address',
                Icon(Icons.location_city_outlined)),
            Obx(
              () => TextFormField(
                controller: _dobController.value,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "date of birth",
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => _selectDate(context),
                    icon: Icon(Icons.calendar_month_rounded),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ToggleSwitch(
              initialLabelIndex: gender == "Male" ? 0 : 1,
              totalSwitches: 2,
              labels: [
                'Male',
                'Female',
              ],
              onToggle: (index) {
                if (index == 0) {
                  gender = "Male";
                } else {
                  gender = "Female";
                }
                print('switched to: $index');
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            VioletButton(
              "Update",
              () => update(data),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Profile"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users-form-data")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return setUserData(data, context);
          }
        },
      ),
    );
  }
}

Widget FormField(controller, inputType, hint, icon) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    decoration: AppStyles().textFieldDecoration(hint, icon),
  );
}