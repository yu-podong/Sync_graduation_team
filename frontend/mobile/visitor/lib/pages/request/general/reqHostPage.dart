import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../class/host.dart';

class VisitHostPage extends StatefulWidget {
  const VisitHostPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VisitHostPage();
  }
}

class _VisitHostPage extends State<VisitHostPage> {
  List<Host> _hostList = List.empty(growable: true);
  List<Color> _tapColor = List.empty(growable: true);
  int _isClick = -1;

  @override
  void initState() {
    // state값 설정
    _hostList = _addHost();
    _tapColor = _addTabColor();
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
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
          // '다음 버튼을 absolute로 배치하기 위한 작업
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /* Page title */
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    child: Text('접견자 정보 입력', style: TextStyle(fontSize: 23),),
                  ),
                  /* Description */
                  Container(
                    margin: EdgeInsets.only(bottom: 50.0),
                    child: Text(
                      '\'nepes\' 내의 모든 직원정보입니다.\n방문 요청할 직원을 선택해주세요.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  /* Host info list */
                  Container(
                    width: double.infinity,
                    height: 400,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      border: Border.symmetric(horizontal: BorderSide(color: Color(0xffDEDEDE)))
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _focus(index);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: _tapColor[index],
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // Host image
                                Icon(Icons.account_circle, size: 45, color: Color(0xffC4C4C4),),
                                // Host name
                                Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(_hostList[index].name!, style: TextStyle(fontSize: 18.0),),
                                ),
                                // Host group
                                Container(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(_hostList[index].group!, style: TextStyle(fontSize: 18.0),),
                                ),
                                // Host position
                                Container(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(_hostList[index].position!, style: TextStyle(fontSize: 18.0),),
                                ),
                              ],
                            ),
                          ),
                        ) ;
                      },
                      itemCount: _hostList.length,
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    child: Text('다음 >', style: TextStyle(fontSize: 20),),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/createVisit/date');
                    },
                  )
              )
            ],
          ),
        )
      ),
    );
  }
  // Host 정보를 저장하는 함수
  List<Host> _addHost() {
    return [
      Host(imagePath: "", name: "host1_name", group: "소속1", position: "직위1"),
      Host(imagePath: "", name: "host2_name", group: "소속2", position: "직위2"),
      Host(imagePath: "", name: "host3_name", group: "소속3", position: "직위3"),
      Host(imagePath: "", name: "host4_name", group: "소속4", position: "직위4"),
      Host(imagePath: "", name: "host5_name", group: "소속5", position: "직위5"),
      Host(imagePath: "", name: "host6_name", group: "소속6", position: "직위6"),
      Host(imagePath: "", name: "host7_name", group: "소속7", position: "직위7"),
      Host(imagePath: "", name: "host8_name", group: "소속8", position: "직위8"),
      Host(imagePath: "", name: "host9_name", group: "소속9", position: "직위9"),
    ];
  }

  // 각 list item의 배경색 값을 저장하는 함수
  List<Color> _addTabColor() {
    return [
      Colors.white, Colors.white, Colors.white,
      Colors.white, Colors.white, Colors.white,
      Colors.white, Colors.white, Colors.white,
    ];
  }

  void _focus(int index) {
    /* 색상 변경 방법 */
    // 1. 처음 클릭된 경우
    if(_isClick == -1) {
      // isClick = index
      _isClick = index;
      // isCLick에 해당하는 item의 배경색을 노란색으로 변경
      _tapColor[_isClick] = Color(0xffFFDE8F);
    }
    else if(_isClick == index) {
      _tapColor[_isClick] = Colors.white;
    }
    // 2. 이미 클린된 게 있는 경우
    else {
      // isClick에 들어있는 item의 배경색을 기본으로 변경
      _tapColor[_isClick] = Colors.white;
      // isClick = index
      _isClick = index;
      // isCLick에 해당하는 item의 배경색을 노란색으로 변경
      _tapColor[_isClick] = Color(0xffFFDE8F);
    }
  }
}