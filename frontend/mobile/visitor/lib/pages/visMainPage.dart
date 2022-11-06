import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobile/pages/requestList/reqListPage.dart';
import 'package:mobile/pages/result/resListPage.dart';
import 'package:mobile/pages/tab/myPage.dart';
import 'package:mobile/pages/tab/noPage.dart';
import 'package:mobile/pages/tab/homePage.dart';
import 'package:mobile/pages/tab/noReadPage.dart';
import 'package:mobile/pages/visit/visListPage.dart';

import '../class/Notice.dart';

class VisMainPage extends StatefulWidget {
  const VisMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VisMainPage();
  }
}

class _VisMainPage extends State<VisMainPage> {
  CupertinoTabBar? tabBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBar = CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.exclamationmark_bubble), label: '공지사항'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: '마이페이지'),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* + button */
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/createVisit');
        },
      ),
      /* tab section */
      body: CupertinoTabScaffold(
        tabBar: tabBar!,
        tabBuilder: (context, value) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              /* Notice menu */
              if(value == 0) {
                return NoPage();
              }
              /* Home menu */
              else if(value == 1) {
                return HomePage();
              }
              /* My page menu */
              else {
                return MyPage();
              }
            },
            onGenerateRoute: (settings) {
              if(settings.name == '/reqList') {
                return CupertinoPageRoute(
                    builder: (_) => ReqListPage()
                );
              }
              else if(settings.name == '/resList') {
                return CupertinoPageRoute(
                    builder: (_) => ResListPage()
                );
              }
              else if(settings.name == '/visList') {
                return CupertinoPageRoute(
                    builder: (_) => VisListPage()
                );
              }
              else if(settings.name == '/notice/read') {
                //final args = settings.arguments as Notice;

                return CupertinoPageRoute(
                    builder: (_) => NoReadPage()
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}