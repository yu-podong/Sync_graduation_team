import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CheckVisitInfoPage extends StatefulWidget {
  const CheckVisitInfoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CheckVisitInfoPage();
  }
}

class _CheckVisitInfoPage extends State<CheckVisitInfoPage> {
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('방문요청'),
      ),
      body: CupertinoPageScaffold(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('최종 확인'),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Text('요청하고자하는 방문약속의 정보가\n정상적으로 입력되었는지 확인해주세요.'),
            ),
            /* Visitor info */
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('접견자 이름'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: CupertinoColors.opaqueSeparator, width: 1),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('user name'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('접견자 소속'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.opaqueSeparator, width: 1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('Smart Factory'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('접견자 직위'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.opaqueSeparator, width: 1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('사원'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            /* Visit date info */
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('방문 날짜'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.opaqueSeparator, width: 1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('2022년 05월 31일'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('입실 시간'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.opaqueSeparator, width: 1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('14:00'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('퇴실 시간'),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.opaqueSeparator, width: 1),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('16:30'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            /* Visit Space info */
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                children: <Widget>[
                  Text('방문장소'),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.opaqueSeparator, width: 1),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text('101호 - 강의실1'),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: CupertinoButton(
                child: Text('생성하기', style: TextStyle(color: CupertinoColors.black),),
                color: CupertinoColors.systemYellow,
                onPressed: () {

                },
              ),
            )
          ],
        ),
      )
    );
  }
}