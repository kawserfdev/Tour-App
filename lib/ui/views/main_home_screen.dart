import 'package:flutter/material.dart';
import 'package:toure_app/ui/views/bottomNavController/bottomNavController.dart';
import 'package:toure_app/ui/views/drawer/drawer_screen.dart';

 
class MainHome_Screen extends StatelessWidget {
  const MainHome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        DrawerScreen(),
        BottomNavController()
      ]),
    );
  }
}