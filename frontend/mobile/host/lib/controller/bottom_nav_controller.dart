import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/add.dart';

enum PageName { HOME, ADD, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.ADD:
        Get.to(() => Add());
        break;
      case PageName.HOME:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      print('exit');
      return true;
    } else {
      print('go to previous page');
      //이전 기록 지움
      bottomHistory.removeLast();
      //히스토리 마지막 값을 인덱스에 넣어서
      var index = bottomHistory.last;
      //이전 페이지로 되돌아감
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
