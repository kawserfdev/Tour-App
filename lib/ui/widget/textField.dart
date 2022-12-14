import 'package:flutter/material.dart';
import '../../const/AppColor.dart';


Future<Widget> customTextField(controller, String hintText) async {
  return TextField(
      controller: controller, decoration: InputDecoration(hintText: hintText));
}

Future<Widget> customTextField2(
  controller,
) async {
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

 Future<Widget> textfieldsearch(String hintText) async{
  return Container(
    height: 50, 
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText:hintText ,
        icon: Icon(Icons.search)
      ),
    ),
  ); 
}


Future<Widget> TextFieldMultiline(
  controller,
) async {
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

