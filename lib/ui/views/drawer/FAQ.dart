import 'package:flutter/material.dart';


class FAQ_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("FAQ"),
      ),
      body: Center(
        child: Text("We will show a PDF here"),
      ),
    );
  }
}