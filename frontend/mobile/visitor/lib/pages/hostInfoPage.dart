import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class/host.dart';

class HostInfoPage extends StatefulWidget {
  const HostInfoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HostInfoPage();
  }
}

class _HostInfoPage extends State<HostInfoPage> {
  List<Host> hostList = List.empty(growable: true);
  List<CupertinoDynamicColor> tapColor = List.empty(growable: true);

  @override
  void initState() {
    hostList.add(Host(imagePath: "", name: "host1_name", group: "소속1", position: "직위1"));
    hostList.add(Host(imagePath: "", name: "host2_name", group: "소속1", position: "직위2"));
    hostList.add(Host(imagePath: "", name: "host3_name", group: "소속2", position: "직위3"));
    hostList.add(Host(imagePath: "", name: "host4_name", group: "소속2", position: "직위1"));
    hostList.add(Host(imagePath: "", name: "host5_name", group: "소속2", position: "직위2"));
    hostList.add(Host(imagePath: "", name: "host6_name", group: "소속3", position: "직위5"));
    hostList.add(Host(imagePath: "", name: "host7_name", group: "소속4", position: "직위6"));
    hostList.add(Host(imagePath: "", name: "host8_name", group: "소속4", position: "직위3"));
    hostList.add(Host(imagePath: "", name: "host9_name", group: "소속5", position: "직위2"));

    for(int i = 0 ; i < 9; i++) {
      tapColor.add(CupertinoColors.systemBackground);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  */
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('방문요청'),
      ),
      body: CupertinoPageScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('접견자 정보 입력'),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('000회사 내의 모든 직원정보입니다.\n방문 요청할 직원을 선택해주세요.'),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 500,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        color: tapColor[index],
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            children: <Widget>[
                              Container(width: 40, height: 40, color: CupertinoColors.opaqueSeparator,),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(hostList[index].name!, style: TextStyle(fontSize: 17.0),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.0),
                                child: Text(hostList[index].group!, style: TextStyle(fontSize: 17.0),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.0),
                                child: Text(hostList[index].position!, style: TextStyle(fontSize: 17.0),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        for(int i = 0 ; i < 9; i++) {
                          if(i == index) {
                            tapColor[i] = CupertinoColors.systemYellow;
                          }
                          tapColor[i] = CupertinoColors.systemBackground;
                        }
                      },
                    ) ;
                  },
                  itemCount: hostList.length,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: GestureDetector(
                child: Text('다음 >'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/createVisit/visitDate');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}