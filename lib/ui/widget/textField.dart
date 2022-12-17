import 'package:flutter/material.dart';
import 'package:toure_app/ui/style/textStyle.dart';
import '../../const/AppColor.dart';

Widget customTextFormField(
    controller, String hintText, keyboardType)  {
  return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText, hintStyle: textStyle.style_m_15black));
}
Widget customTextField(
  controller,
)  {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: AppColor.gray,
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: TextField(
      controller: controller,
    ),
  );
}

Widget textfieldsearch(String hintText, controller)  {
  return Container(
    height: 50,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          hintStyle: textStyle.style_L_15black,
          icon: Icon(Icons.search)),
    ),
  );
}

Widget TextFieldMultiline(
  controller,
)  {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: AppColor.gray,
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
    ),
  );
}