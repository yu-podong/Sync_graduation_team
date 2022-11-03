import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/todayListItem.dart';
import '../class/promise.dart';

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
    promiseList.add(Promise(hostName: 'host1', position: '직위1', place: 'S4-1 114호', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: 'host2', position: '직위2', place: 'S4-1 114호', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: 'host3', position: '직위3', place: 'S4-1 114호', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: 'host4', position: '직위4', place: 'S4-1 114호', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: 'host5', position: '직위5', place: 'S4-1 114호', time: '14:00 ~ 16:00'));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    return TodayListItem(promise: promiseList[position],);
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
                  onPressed: null,
                  child: Text('신청내역', style: TextStyle(fontSize: 18, color: Colors.black),),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      backgroundColor: MaterialStateProperty.all(Color(0xffFFCBCB))
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('승인결과 내역', style: TextStyle(fontSize: 18, color: Colors.black),),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      backgroundColor: MaterialStateProperty.all(Color(0xffCBDCFF))
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('방문이력', textAlign: TextAlign.justify, style: TextStyle(fontSize: 18, color: Colors.black),),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      backgroundColor: MaterialStateProperty.all(Color(0xffECD0F9))
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
