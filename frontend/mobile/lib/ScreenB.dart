import 'package:flutter/material.dart';
import 'package:mobile/components/image_data.dart';
import 'package:mobile/pages/home.dart';
import 'contoller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class ScreenB extends GetView<BottomNavController> {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => Scaffold(
        body: IndexedStack(
          index: controller.pageIndex.value,
          children: [
            const Home(),
            Container(child: Center(child: Text('ADD')),),
            Container(child: Center(child: Text('MYPAGE')),),

          ],

        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.pageIndex.value,
          onTap: controller.changeBottomNav,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.home_off),
              activeIcon: ImageData(IconsPath.home_on),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.add,width: 80),
              label: 'Plus'
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.user_off),
              activeIcon: ImageData(IconsPath.user_on),
              label: 'MyPage',

            ),
          ],
        ),
      ),),
      onWillPop: controller.willPopAction,
    );
  }
}
