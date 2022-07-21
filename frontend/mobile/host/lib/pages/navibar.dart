import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vms/components/buttons.dart';
import 'package:vms/pages/home.dart';
import 'package:vms/pages/mypage.dart';
import 'package:vms/pages/MyPromise.dart';
import 'package:vms/pages/hostrequest1.dart';
import 'package:vms/pages/newrequestlist.dart';
import 'package:vms/pages/notice.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({Key? key}) : super(key: key);

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    Notice(),
    Main(),
    MyPage(),
  ];

  void _inItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xffffd3ab),
            unselectedItemColor: Colors.white.withOpacity(.60),
            currentIndex: _selectedIndex,
            onTap: (int index) => {
                  setState((() {
                    _selectedIndex = index;
                  }))
                },
            items: [
              BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? const Icon(Icons.campaign, color: Color(0xffFFDE8F))
                      : const Icon(
                          Icons.campaign_outlined,
                          color: Colors.black,
                        ),
                  label: 'Notice'),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? const Icon(
                          Icons.home,
                          color: Color(0xffFFDE8F),
                        )
                      : const Icon(Icons.home_outlined, color: Colors.black),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? const Icon(Icons.account_circle_sharp,
                          color: Color(0xffFFDE8F))
                      : const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                        ),
                  label: 'Profile')
            ]),
      ),
      onWillPop: () {
        return Future(() => false);
      },
    );
  }
}
