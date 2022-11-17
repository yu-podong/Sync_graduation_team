import 'package:flutter/material.dart';

import 'package:mobile/pages/ReqListPage.dart';
import 'package:mobile/pages/MyPage.dart';
import 'package:mobile/pages/noPage.dart';
import 'package:mobile/pages/HosMainPage.dart';
import 'package:mobile/pages/noticeReadPage.dart';
import 'package:mobile/pages/VisitCheckPage.dart';
import 'package:mobile/pages/visListPage.dart';


class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Navigation();
  }
}

class _Navigation extends State<Navigation> {
  BottomNavigationBar? tabBar;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 1;
  
  List<Widget> pageList = [
    const NoPage(),
    const HosMainPage(),
    const MyPage(),
  ];

  @override
  void initState() {
    super.initState();
    tabBar = BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.announcement), label: '공지사항'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이 페이지'),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: const Color(0xffFFDE8F),
        unselectedItemColor: const Color(0xffFFDE8F),
    );
  }

  void _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed('/notice');
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed('/home');
        break;
      case 2:
        _navigatorKey.currentState?.pushReplacementNamed('/my');
        break;
    }
    setState(() {
      _currentIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* tab section */
      body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
      bottomNavigationBar: tabBar,
    );
  }
}

Route<dynamic> generateRoute (settings) {
  if(settings.name == '/reqlist') {
    return MaterialPageRoute(
      builder: (_) => ReqListPage()
    );
 
  }
  else if(settings.name == '/reslist') {
    return MaterialPageRoute(
      builder: (_) => VisListPage()
    );
  }
  else if(settings.name == '/check') {
    return MaterialPageRoute(
      builder: (_) => VisitCheckPage()
    );
  }
  else if(settings.name == '/notice') {
    return MaterialPageRoute(
      builder: (_) => NoPage()
    );
  }
  else if(settings.name == '/notice/read') {
    return MaterialPageRoute(
      builder: (_) => NoticeReadPage()
      );
    }
  else if(settings.name == '/my') {
    return MaterialPageRoute(
      builder: (_) => MyPage()
    );
  }
    return MaterialPageRoute(
      builder: (_) => HosMainPage()
    );
}
