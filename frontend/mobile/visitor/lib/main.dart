import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hostMainPage.dart';
import 'pages/createVisitPage.dart';
import 'pages/hostInfoPage.dart';
import 'pages/visitDatePage.dart';
import 'pages/visitSpacePage.dart';
import 'pages/checkVisitInfoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => const HostMainPage(),
        '/createVisit' : (context) => const CreateVisitPage(),
        '/createVisit/hostInfo' : (context) => const HostInfoPage(),
        '/createVisit/visitDate' : (context) => const VisitDatePage(),
        '/createVisit/visitSpace' : (context) => const VisitSpacePage(),
        '/createVisit/checkVisitInfo' : (context) => const CheckVisitInfoPage(),
      },
    );
  }
}