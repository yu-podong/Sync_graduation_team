import 'package:flutter/material.dart';
import 'package:mobile/ScreenA.dart';
import 'package:mobile/ScreenB.dart';
import 'package:mobile/ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>ScreenA(),
        '/home':(context)=>ScreenB(),
        '/join':(context)=>ScreenC()
      },
    );
  }
}


