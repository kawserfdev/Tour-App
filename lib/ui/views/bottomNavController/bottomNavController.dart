import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toure_app/ui/views/bottomNavController/pages/nav_Add.dart';
import 'package:toure_app/ui/views/bottomNavController/pages/nav_Favorite.dart';
import 'package:toure_app/ui/views/bottomNavController/pages/nav_Home.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;
  final _pages = [
    NavFavorite_Screen(),
    NavAdd_Screen(),
    NavHome_Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 400),
        top: _drawer.value == false ? 0 : 100.h,
        bottom: _drawer.value == false ? 0 : 100.h,
        left: _drawer.value == false ? 0 : 200.w,
        right: _drawer.value == false ? 0 : -100.w,
        child: Container(
          decoration: BoxDecoration(),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: _drawer.value == false
                  ? IconButton(
                      onPressed: () {
                        _drawer.value = true;
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _drawer.value = false;
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      iconSize: 20.sp,
                    ),
              title: Text(
                "Shelter",
                style: TextStyle(color: Colors.black, fontSize: 30.sp),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => _currentIndex.value = value,
              currentIndex: _currentIndex.value,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30.sp,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add, size: 30.sp), label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined, size: 30.sp),
                    label: "Favorite"),
              ],
            ),
            body: _pages[_currentIndex.value],
          ),
        ),
      ),
    );
  }
}
