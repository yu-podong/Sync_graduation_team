import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width; //width설정안하면 기본값 55
  ImageData(this.icon,{Key? key,this.width=55,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        icon,
        width: width!/Get.mediaQuery.devicePixelRatio);
  }
}

class IconsPath{
  static String get home_off => 'assets/images/home 1.png';
  static String get home_on => 'assets/images/home on.png';
  static String get user_off => 'assets/images/user 1.png';
  static String get user_on => 'assets/images/user on.png';
  static String get add => 'assets/images/plus 1.png';
  static String get bell => 'assets/images/bell-ring 1.png';
  static String get logo => 'assets/images/logo.png';

}