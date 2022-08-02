import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabPages/homePage.dart';

class VisitorMainPage extends StatefulWidget {
  const VisitorMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VisitorMainPage();
  }
}

class _VisitorMainPage extends State<VisitorMainPage> {
  CupertinoTabBar? tabBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBar = CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.envelope_open_fill)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.wrench)),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Top bar */
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('메인화면'),
      ),
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
          /* Notice menu */
          if(value == 0) {
            return Container();
          }
          /* Home menu */
          else if(value == 1) {
            return HomePage();
          }
          /* My page menu */
          else {
            return Container();
          }
        },
      ),
    );
  }
}