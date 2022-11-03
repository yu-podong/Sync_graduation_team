import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/requestList/reqItemCom.dart';
import 'package:mobile/pages/tab/homePage.dart';

import '../../class/promise.dart';
import '../../components/proDetailCom.dart';

class ReqListPage extends StatefulWidget {
  const ReqListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReqListPage();
  }
}

class _ReqListPage extends State<ReqListPage> {
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
        middle: Text('요청내역'),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            /* 페이지 설명 부분 */
            Text('승인결과가 결정되지 않은 요청들이 보입니다.', style: TextStyle(fontSize: 18),),
            Padding(padding: EdgeInsets.only(bottom: 40.0)),
            /* 요청한 약속 리스트 */
            Flexible(
              fit: FlexFit.tight,
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
                    child: ReqItemCom(promise: promiseList[position],),
                  );
                },
                itemCount: promiseList.length,
              ),
            )
          ],
        )
      )
    );
  }
}