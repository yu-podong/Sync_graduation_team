import 'package:flutter/material.dart';
import 'package:mobile/binding/init_bindings.dart';
import 'package:mobile/login.dart';
import 'package:mobile/ScreenB.dart';
import 'package:mobile/ScreenC.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Login(),
        '/home':(context)=>ScreenB(),
        '/join':(context)=>ScreenC()
      },initialBinding: InitBinding(),
    );
  }
}


