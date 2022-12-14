import 'package:flutter/material.dart';
import '../../../const/AppColor.dart';

Widget fullWidthButton(
  String title,
  onPressed,
) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.blue,
        fixedSize: Size(double.maxFinite, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    child: Text(title),
  );
}

Widget textbutton(onPressed, String title) {
  return TextButton(onPressed: onPressed, child: Text(title));
}

Widget iconbutton(onPressed, icon) {
  return IconButton(onPressed: onPressed, icon: Icon(icon));
}
