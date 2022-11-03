import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/visitLoginPage.dart';
import 'pages/visitorMainPage.dart';
import 'pages/request/createVisitPage.dart';
import 'pages/request/general/hostInfoPage.dart';
import 'pages/request/general/visitDatePage.dart';
import 'pages/request/general/visitSpacePage.dart';
import 'pages/request/general/checkVisitInfoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: '/login',
      routes: {
        '/login' : (context) => const VisitLoginPage(),
        '/' : (context) => const VisitorMainPage(),
        '/createVisit' : (context) => const CreateVisitPage(),
        '/createVisit/hostInfo' : (context) => const HostInfoPage(),
        '/createVisit/visitDate' : (context) => const VisitDatePage(),
        '/createVisit/visitSpace' : (context) => const VisitSpacePage(),
        '/createVisit/checkVisitInfo' : (context) => const CheckVisitInfoPage(),
      },
    );
  }
}