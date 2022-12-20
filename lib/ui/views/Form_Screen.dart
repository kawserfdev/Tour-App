import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toure_app/bussiness%20logic/form.dart';
import 'package:toure_app/ui/widget/appButton/AppButton.dart';
import '../../const/AppColor.dart';
import '../../const/AppString.dart';
import '../widget/textField.dart';

class User_Form extends StatelessWidget {
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
        lastDate: DateTime(2030));
        if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month} - ${selected.year}";
      _dobController.value.text = dob!;


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 80.r, right: 30.r, left: 30.r),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppString.MoreAbout,
            style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.black),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            AppString.info_sefty,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 50.h,
          ),
          customTextFormField(
              _nameController, 'Full Name', TextInputType.emailAddress),
          customTextFormField(
              _phoneController, 'Phone Number', TextInputType.phone),
          customTextFormField(
              _addressController, 'Address', TextInputType.text),
          Obx(
            () => TextFormField(
              controller: _dobController.value,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Date of Birth',
                hintStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black),
                suffixIcon: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_month),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ToggleSwitch(
            minWidth: 100.0.w,
            initialLabelIndex: 1,
            cornerRadius: 18.0.r,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            labels: ['Male', 'Female'],
            icons: [Icons.male, Icons.female],
            activeBgColors: [
              [Colors.pink],
              [Colors.pink]
            ],
            onToggle: (index) {
              if (index == 0) {
                gender = "Male";
              } else {
                gender == "Female";
              }
              print('switched to: $index');
            },
          ),
          SizedBox(
            height: 80.h,
          ),
          VioletButton(
            'Submit',
            () => UsersInfo().sendFormDatatoDB(
                _nameController.text,
                int.parse(_phoneController.text),
                _addressController.text,
                dob!,
                gender),
          ),
        ]),
      ),
    );
  }
}
