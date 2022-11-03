import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisListPage extends StatefulWidget {
  const VisListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VisListPage();
  }
}

class _VisListPage extends State<VisListPage> {
  CupertinoTabBar? tabBar;

  @override
  void initState() {

  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemBackground,
          middle: Text('방문이력'),
        ),
        child: Container(
          padding: EdgeInsets.all(30.0),
        )
    );
  }
}