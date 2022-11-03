import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoPage extends StatefulWidget {
  const NoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NoPage();
  }
}

class _NoPage extends State<NoPage> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('공지사항'),
      ),
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('공지사항 페이지입니다.')
          ],
        ),
      ),
    );
  }
}
