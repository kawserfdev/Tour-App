import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/style/textStyle.dart';
import 'package:toure_app/ui/widget/appButton/AppButton.dart';
import '../../const/AppString.dart';
import '../widget/textField.dart';

class User_Form extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    if (selected != null && selected != selectedDate) {
      _dobController.value.text =
          "${selected.day}-${selected.month}-${selected.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppString.MoreAbout,
            style: textStyle.style_m_36black,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            AppString.info_sefty,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 50,
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
                hintStyle: textStyle.style_m_15black,
                suffixIcon: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_month),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 60,
          ),
          SizedBox(height: 80,),
          VioletButton('Submit', ()=>Get.toNamed(privacyPolicy))
        ]),
      ),
    );
  }
}
