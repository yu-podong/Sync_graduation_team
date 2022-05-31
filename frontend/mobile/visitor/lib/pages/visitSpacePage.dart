import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../class/space.dart';

class VisitSpacePage extends StatefulWidget {
  const VisitSpacePage({Key? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _VisitSpacePage();
  }
}

class _VisitSpacePage extends State<VisitSpacePage> {
  List<Space> spaceList = List.empty(growable: true);
  List<CupertinoDynamicColor> tapColor = List.empty(growable: true);

  @override
  void initState() {
    spaceList.add(Space(roomId: '101호', roomName: '강의실1', isEnable: '사용가능'));
    spaceList.add(Space(roomId: '102호', roomName: '강의실2', isEnable: '불가능'));
    spaceList.add(Space(roomId: '103호', roomName: '강의실3', isEnable: '사용가능'));
    spaceList.add(Space(roomId: '201호', roomName: '강의실4', isEnable: '불가능'));
    spaceList.add(Space(roomId: '202호', roomName: '강의실5', isEnable: '사용가능'));
    spaceList.add(Space(roomId: '203호', roomName: '강의실6', isEnable: '불가능'));

    for(int i = 0 ; i < 6; i++) {
      tapColor.add(CupertinoColors.systemBackground);
    }
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Text('방문장소 입력'),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Text('000회사 내의 방들입니다.\n방문장소로 사용할 곳을 선택해주세요.'),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                height : 500,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        color: tapColor[index],
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(spaceList[index].roomId!),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(spaceList[index].roomName!),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 60.0),
                                child: Text(spaceList[index].isEnable!),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        for(int i = 0 ; i < 6; i++) {
                          if(i == index) {
                            tapColor[i] = CupertinoColors.systemYellow;
                            continue;
                          }
                          tapColor[i] = CupertinoColors.systemBackground;
                        }
                      },
                    );
                  },
                  itemCount: spaceList.length,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: GestureDetector(
                child: Text('다음 >'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/createVisit/checkVisitInfo');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}