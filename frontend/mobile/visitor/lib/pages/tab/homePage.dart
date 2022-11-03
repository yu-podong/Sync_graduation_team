import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/proDetailCom.dart';

import '../../components/todayItemCom.dart';
import '../../class/promise.dart';

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
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        // 각 당일 접견약속 클릭 시,
                        onTap: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) => CupertinoAlertDialog(
                                content: ProDetailCom(promise: promiseList[position]),
                              )
                          );
                        },
                        child: TodayItemCom(promise: promiseList[position],),
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
