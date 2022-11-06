import 'package:flutter/cupertino.dart';
import 'package:mobile/class/Notice.dart';
import 'package:mobile/pages/request/companionPage.dart';
import 'package:mobile/pages/tab/myPage.dart';
import 'package:mobile/pages/tab/noPage.dart';
import 'package:mobile/pages/tab/noReadPage.dart';

import 'pages/visLoginPage.dart';
import 'pages/visMainPage.dart';
import 'pages/request/reqPurposePage.dart';
import 'pages/request/general/reqHostPage.dart';
import 'pages/request/general/reqDatePage.dart';
import 'pages/request/general/reqSpacePage.dart';
import 'pages/request/general/reqFinalPage.dart';
import 'pages/requestList/reqListPage.dart';
import 'package:mobile/pages/result/resListPage.dart';
import 'package:mobile/pages/visit/visListPage.dart';

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
        '/' : (context) => const VisMainPage(),
        '/notice' : (context) => const NoPage(),
        '/notice/read' : (context) => const NoReadPage(),
        '/my' : (context) => const MyPage(),
        '/login' : (context) => const VisLoginPage(),
        '/reqList' : (context) => const ReqListPage(),
        '/resList' : (context) => const ResListPage(),
        '/visList' : (context) => const VisListPage(),
        '/createVisit' : (context) => const ReqPurposePage(),
        '/createVisit/host' : (context) => const ReqHostPage(),
        '/createVisit/date' : (context) => const ReqDatePage(),
        '/createVisit/space' : (context) => const ReqSpacePage(),
        '/createVisit/companion' : (context) => const CompanionPage(),
        '/createVisit/final' : (context) => const ReqFinalPage(),
      },
    );
  }
}
