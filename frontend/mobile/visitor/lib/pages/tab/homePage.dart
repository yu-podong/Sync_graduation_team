import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/proDetailCom.dart';

import '../../components/todayItemCom.dart';
import '../../class/Promise.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  List<Promise> promiseList = List.empty(growable: true);

  @override
  void initState() {
    promiseList.add(Promise(hostName: '접견자 이름1', position: '직위1', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: '접견자 이름2', position: '직위2', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: '접견자 이름3', position: '직위3', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: '접견자 이름4', position: '직위4', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: '접견자 이름5', position: '직위5', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00'));
  }

  Widget _showProDetailEachCompo(pos1, pos2) {
    if(pos2 == 0) {
      return Container(
        margin: EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('접견자 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(this.promiseList[pos1].hostName, style: TextStyle(fontSize: 16),)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(this.promiseList[pos1].position, style: TextStyle(fontSize: 10, color: Color(0xff8D8D8D)),),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }
    else if(pos2 == 1) {
      /* 접견 목적 */
      return Container(
        margin: EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('접견 목적', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffEDEDED)),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Text('promise.purpose', style: TextStyle(fontSize: 14),),
            )
          ],
        ),
      );
    }
    else if(pos2 == 2) {
      /* 접견약속 정보 */
      return Container(
        margin: EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('접견약속 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            /* 접견날짜 */
            Row(
              children: <Widget>[
                /* '접견날짜' */
                Text('접견날짜', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                /* 년 */
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  child: Text('2022', style: TextStyle(fontSize: 14,)),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 5.0)),
                Text('년', style: TextStyle(fontSize: 13, color: Color(0xff000000)),),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                /* 월 */
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  child: Text('12', style: TextStyle(fontSize: 14,)),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 5.0)),
                Text('월', style: TextStyle(fontSize: 13, color: Color(0xff000000)),),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                /* 일 */
                Padding(padding: EdgeInsets.only(right: 5.0)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  child: Text('31', style: TextStyle(fontSize: 14,)),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 5.0)),
                Text('일', style: TextStyle(fontSize: 13, color: Color(0xff000000)),),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            /* 접견시간 */
            Row(
              children: <Widget>[
                /* '접견시간' */
                Text('접견시간', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(this.promiseList[pos1].time, style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            /* 접견장소 */
            Row(
              children: <Widget>[
                Text('접견장소', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text('promise.접견장소', style: TextStyle(fontSize: 14),),
                ),
              ],
            )
          ],
        ),
      );
    }
    else if(pos2 == 3) {
      /* 방문자 정보 */
      return Container(
        margin: EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('방문자 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(this.promiseList[pos1].hostName, style: TextStyle(fontSize: 16),)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(this.promiseList[pos1].position, style: TextStyle(fontSize: 10,color: Color(0xff8D8D8D)),),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }
    else {
      /* 동행자 정보 */
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('동행자 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(this.promiseList[pos1].hostName, style: TextStyle(fontSize: 16),)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(this.promiseList[pos1].position, style: TextStyle(fontSize: 10,color: Color(0xff8D8D8D)),),
                    )
                  ],
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(this.promiseList[pos1].hostName, style: TextStyle(fontSize: 16),)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(this.promiseList[pos1].position, style: TextStyle(fontSize: 10,color: Color(0xff8D8D8D)),),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemBackground,
          middle: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('소속부서', style: TextStyle(fontWeight: FontWeight.normal),),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Text('직책', style: TextStyle(fontWeight: FontWeight.normal),),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Text('이름', style: TextStyle(fontWeight: FontWeight.normal),),
                  ],
                ),
                Icon(CupertinoIcons.bell, )
              ],
            ),
          )
      ),
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /* TODAY */
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'TODAY',
                style: TextStyle(fontSize: 25),
              ),
            ),
            /* 당일 잡혀있는 약속을 보여주는 부분 */
            Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  padding: EdgeInsets.all(20),
                  color: Color(0xffFFDE8F),
                  child: ListView.builder(
                    itemBuilder: (context, pos1) {
                      return GestureDetector(
                        // 각 당일 접견약속 클릭 시,
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) => Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget> [
                                /* 팝업 배경 */
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Color(0xffDEDEDE).withOpacity(0.3),
                                  ),
                                ),
                                /* 해당 약속의 세부정보 */
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      color: Color(0xffFFFFFF),
                                      width: MediaQuery.of(context).size.width*0.8,
                                      height: MediaQuery.of(context).size.height*0.7,
                                      padding: EdgeInsets.all(20.0),
                                      child: ListView.builder(
                                        itemBuilder: (context, pos2) {
                                          return _showProDetailEachCompo(pos1, pos2);
                                        },
                                        itemCount: 5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: TodayItemCom(promise: promiseList[pos1],),
                      );
                    },
                    itemCount: promiseList.length,
                  ),
                )
            ),
            /* 3개의 메뉴버튼 */
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/reqList');
                    },
                    child: Text('요청내역', style: TextStyle(fontSize: 16, color: Colors.black),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                        backgroundColor: MaterialStateProperty.all(Color(0xffFFCBCB)),
                        alignment: Alignment.centerLeft
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/resList');
                    },
                    child: Text('승인결과 내역', style: TextStyle(fontSize: 16, color: Colors.black),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                        backgroundColor: MaterialStateProperty.all(Color(0xffCBDCFF)),
                        alignment: Alignment.centerLeft
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/visList');
                    },
                    child: Text('방문이력', style: TextStyle(fontSize: 16, color: Colors.black),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                        backgroundColor: MaterialStateProperty.all(Color(0xffECD0F9)),
                        alignment: Alignment.centerLeft
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
