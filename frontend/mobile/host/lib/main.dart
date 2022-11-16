import 'package:flutter/material.dart';
import 'package:mobile/pages/HosMainPage.dart';
import 'package:mobile/pages/ReqListPage.dart';
import 'package:mobile/pages/VisListPage.dart';
import 'package:mobile/pages/VisitCheckPage.dart';
import 'package:mobile/pages/noPage.dart';
import 'package:mobile/pages/HosLoginPage.dart';
import 'package:mobile/pages/NavigationPage.dart';
import 'package:mobile/pages/MyPage.dart';
import 'package:mobile/pages/noticeReadPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => const Navigation(),
        '/notice': (context) => const NoPage(),
        '/notice/read': (context) => const NoticeReadPage(),
        '/reqlist':(context) => const ReqListPage(),
        '/reslis0.t':(context) => const VisListPage(),
        '/check': (context) => const VisitCheckPage(),
        '/my': (context) => const MyPage(),
        '/login': (context) => const HosLoginPage(),
        '/home':(context) => const HosMainPage(),
      },
    );
  }
}
