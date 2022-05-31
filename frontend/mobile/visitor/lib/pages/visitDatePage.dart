import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../components/timePicker.dart';
import '../components/datePicker.dart';

class VisitDatePage extends StatefulWidget {
  const VisitDatePage({Key? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _VisitDatePage();
  }
}

class _VisitDatePage extends State<VisitDatePage>{

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Top bar */
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('방문요청'),
      ),
      /* Body */
      body: CupertinoPageScaffold(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('방문날짜 입력'),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: DatePicker(),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: CupertinoTimerPickerSample(),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: GestureDetector(
                child: Text('다음 >'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/createVisit/visitSpace');
                },
              ),
            )
          ],
        ),
      ),
    );
  }


}