import 'package:flutter/material.dart';
import 'package:mobile/components/proDetailCom.dart';
import 'package:mobile/components/todayItemCom.dart';

import '../class/Promise.dart';

class HosMainPage extends StatefulWidget {
  const HosMainPage({Key? key}) : super(key: key);

  @override
  State<HosMainPage> createState() => _HosMainPageState();
}

class _HosMainPageState extends State<HosMainPage> {
  List<Promise> promiseList = List.empty(growable: true);

  @override
  void initState() {
    promiseList.add(Promise(
        hostName: '접견자 이름1',
        visitName: '방문자 이름1',
        position: '직위1',
        place: 'S4-1 114호',
        date: '2022.11.21',
        time: '14:00 ~ 16:00'));
    promiseList.add(Promise(
        hostName: '접견자 이름2',
        visitName: '방문자 이름2',
        position: '직위2',
        place: 'S4-1 114호',
        date: '2022.11.21',
        time: '14:00 ~ 16:00'));
    promiseList.add(Promise(
        hostName: '접견자 이름3',
        visitName: '방문자 이름3',
        position: '직위3',
        place: 'S4-1 114호',
        date: '2022.11.21',
        time: '14:00 ~ 16:00'));
    promiseList.add(Promise(
        hostName: '접견자 이름4',
        visitName: '방문자 이름4',
        position: '직위4',
        place: 'S4-1 114호',
        date: '2022.11.21',
        time: '14:00 ~ 16:00'));
    promiseList.add(Promise(
        hostName: '접견자 이름5',
        visitName: '방문자 이름5',
        position: '직위5',
        place: 'S4-1 114호',
        date: '2022.11.21',
        time: '14:00 ~ 16:00'));
  }

  Widget _showProDetailEachCompo(pos1, pos2) {
    if (pos2 == 0) {
      return Container(
        margin: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('접견자 정보',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 30.0,
                  color: Color(0xff8D8D8D),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          this.promiseList[pos1].hostName,
                          style: const TextStyle(fontSize: 16),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        this.promiseList[pos1].position,
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xff8D8D8D)),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else if (pos2 == 1) {
      /* 접견 목적 */
      return Container(
        margin: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('접견 목적',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Text(
                'promise.purpose',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      );
    } else if (pos2 == 2) {
      /* 접견약속 정보 */
      return Container(
        margin: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('접견약속 정보',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            /* 접견날짜 */
            Row(
              children: <Widget>[
                /* '접견날짜' */
                const Text(
                  '접견날짜',
                  style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),
                ),
                const Padding(padding: EdgeInsets.only(right: 20.0)),
                /* 년 */
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 7.0),
                  child: const Text('2022',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                const Text(
                  '년',
                  style: TextStyle(fontSize: 13, color: Color(0xff000000)),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                /* 월 */
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 7.0),
                  child: const Text('12',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                const Text(
                  '월',
                  style: TextStyle(fontSize: 13, color: Color(0xff000000)),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                /* 일 */
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 7.0),
                  child: const Text('31',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                const Text(
                  '일',
                  style: TextStyle(fontSize: 13, color: Color(0xff000000)),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            /* 접견시간 */
            Row(
              children: <Widget>[
                /* '접견시간' */
                const Text(
                  '접견시간',
                  style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),
                ),
                const Padding(padding: EdgeInsets.only(right: 20.0)),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    this.promiseList[pos1].time,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            /* 접견장소 */
            Row(
              children: <Widget>[
                const Text(
                  '접견장소',
                  style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),
                ),
                const Padding(padding: EdgeInsets.only(right: 20.0)),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 15.0),
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEDEDED)),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Text(
                    'promise.접견장소',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    } else if (pos2 == 3) {
      /* 방문자 정보 */
      return Container(
        margin: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('방문자 정보',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 30.0,
                  color: Color(0xff8D8D8D),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          this.promiseList[pos1].visitName,
                          style: const TextStyle(fontSize: 16),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        this.promiseList[pos1].position,
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xff8D8D8D)),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else {
      /* 동행자 정보 */
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('동행자 정보',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 30.0,
                  color: Color(0xff8D8D8D),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          this.promiseList[pos1].visitName,
                          style: const TextStyle(fontSize: 16),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        this.promiseList[pos1].position,
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xff8D8D8D)),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 30.0,
                  color: Color(0xff8D8D8D),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          this.promiseList[pos1].visitName,
                          style: const TextStyle(fontSize: 16),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        this.promiseList[pos1].position,
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xff8D8D8D)),
                      ),
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //뒤로가기 버튼 없애기
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(children: const [
          Text(
            '소속부서',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 13.0),
          ),
          Padding(padding: EdgeInsets.only(right: 10.0)),
          Text(
            '직책',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 13.0),
          ),
          Padding(padding: EdgeInsets.only(right: 10.0)),
          Text(
            '이름',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 13.0),
          ),
          Padding(padding: EdgeInsets.only(right: 10.0)),
        ]),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.notifications_none),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'TODAY',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              // 당일에 잡혀있는 약속을 보여주는 부분
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  padding: const EdgeInsets.all(20),
                  color: const Color(0xffFFDE8F),
                  child: ListView.builder(
                    itemBuilder: (context, pos1) {
                      return GestureDetector(
                        // 당일 약속 접견약속 클릭
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                /* 팝업 배경 */
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: const Color(0xffDEDEDE).withOpacity(0.3),
                                  ),
                                ),
                                /* 해당 약속의 세부정보 */
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      color: const Color(0xffFFFFFF),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      padding: const EdgeInsets.all(20.0),
                                      child: ListView.builder(
                                        itemBuilder: (context, pos2) {
                                          return _showProDetailEachCompo(
                                              pos1, pos2);
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
                        child: TodayItemCom(promise: promiseList[pos1]),
                      );
                    },
                    itemCount: promiseList.length,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
                        child: const Text(
                          '신규 접수내역',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffFFCBCB)),
                            alignment: Alignment.centerLeft),
                        onPressed: (() {
                          Navigator.of(context).pushNamed('/check');
                        }),
                      )),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
                        child: const Text(
                          '승인 이력',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffCBDCFF)),
                            alignment: Alignment.centerLeft),
                        onPressed: (() {
                          Navigator.of(context).pushNamed('/reqlist');
                        }),
                      )),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
                        child: const Text(
                          '방문조회',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffECD0F9)),
                            alignment: Alignment.centerLeft),
                        onPressed: (() {
                          Navigator.of(context).pushNamed('/reslist');
                        }),
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
