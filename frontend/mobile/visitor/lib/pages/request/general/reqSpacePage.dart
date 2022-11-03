import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../class/room.dart';

class VisitSpacePage extends StatefulWidget {
  const VisitSpacePage({Key? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _VisitSpacePage();
  }
}

class _VisitSpacePage extends State<VisitSpacePage> {
  List<Room> _roomList = List.empty(growable: true);
  List<Color> _tapColor = List.empty(growable: true);
  int _isClick = -1;

  @override
  void initState() {
    // state값 설정
    _roomList = _addRoom();
    _tapColor = _addTabColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Top bar */
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
                      child: Text('접견 장소 입력', style: TextStyle(fontSize: 23),),
                    ),
                    /* Description */
                    Container(
                      margin: EdgeInsets.only(bottom: 50.0),
                      child: Text(
                        '\'nepes\' 내의 모든 장소입니다.\n접견장소로 사용할 곳을 선택해주세요.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    /* Room info list */
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
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                              color: _tapColor[index],
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // Host name
                                  Container(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(_roomList[index].roomId!, style: TextStyle(fontSize: 18.0),),
                                  ),
                                  // Room name
                                  Container(
                                    padding: EdgeInsets.only(left: 30.0),
                                    child: Text(_roomList[index].roomName!, style: TextStyle(fontSize: 18.0),),
                                  ),
                                  // isEnable
                                  Container(
                                    padding: EdgeInsets.only(left: 30.0),
                                    child: Text(_roomList[index].isEnable!, style: TextStyle(fontSize: 18.0, color: _setEnableTextColor(index)),),
                                  ),
                                ],
                              ),
                            ),
                          ) ;
                        },
                        itemCount: _roomList.length,
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
                        Navigator.of(context).pushReplacementNamed('/createVisit/final');
                      },
                    )
                )
              ],
            ),
          )
      ),
    );
  }

  // 회사 내에 존재하는 장소 정보를 저장하는 함수
  List<Room> _addRoom() {
    return [
      Room(id: 1, roomId: "101호", roomName: "강의실1", isEnable: "사용가능"),
      Room(id: 2, roomId: "102호", roomName: "강의실2", isEnable: "사용가능"),
      Room(id: 3, roomId: "103호", roomName: "강의실3", isEnable: "사용가능"),
      Room(id: 4, roomId: "104호", roomName: "강의실4", isEnable: "사용 불가능"),
      Room(id: 5, roomId: "105호", roomName: "강의실5", isEnable: "사용 불가능"),
      Room(id: 6, roomId: "106호", roomName: "강의실6", isEnable: "사용 불가능"),
      Room(id: 7, roomId: "107호", roomName: "강의실7", isEnable: "사용가능"),
      Room(id: 8, roomId: "108호", roomName: "강의실8", isEnable: "사용 불가능"),
      Room(id: 9, roomId: "109호", roomName: "강의실9", isEnable: "사용가능"),
    ];
  }

  // 각 list item의 배경색 값을 저자하는 함수
  List<Color> _addTabColor() {
    return [
      Colors.white, Colors.white, Colors.white,
      Colors.white, Colors.white, Colors.white,
      Colors.white, Colors.white, Colors.white,
    ];
  }

  /* 색상 변경 방법 */
  void _focus(int index) {
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

  // 회사 장소가 사용 가능한 지에 따라, 텍스트 색을 설정하는 함수
  Color _setEnableTextColor(int index) {
    // 해당 item의 상태가 '사용가능이면, 초록색으로 설정
    if(_roomList[index].isEnable == "사용가능") {
      return Color(0xff33A553);
    }
    // 아니라면, 빨간색으로 설정
    else {
      return Color(0xffC02828);
    }
  }
}