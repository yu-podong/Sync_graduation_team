import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/result/re-reqPopCom.dart';

import '../../class/promise.dart';
import '../../components/proDetailCom.dart';
import '../../components/result/resItemCom.dart';

class ResListPage extends StatefulWidget {
  const ResListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResListPage();
  }
}

class _ResListPage extends State<ResListPage> {
  List<Promise> promiseList = List.empty(growable: true);
  List<Widget> _resFinalDetailCom = List<Widget>.empty();
  @override
  void initState() {
    promiseList.add(Promise(hostName: '접견자 이름1', position: '직위1', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00', isOK: true));
    promiseList.add(Promise(hostName: '접견자 이름2', position: '직위2', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: '접견자 이름3', position: '직위3', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00', isOK: true));
    promiseList.add(Promise(hostName: '접견자 이름4', position: '직위4', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00'));
    promiseList.add(Promise(hostName: '접견자 이름5', position: '직위5', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00', isOK: true));
  }

  Widget _showFianlDetailCompo(int pos1, int pos2, BuildContext context) {
    if (pos2 == 0) {
      return ProDetailCom(promise: this.promiseList[pos1],);
    }
    else {
      return this.promiseList[pos1].isOK ? Container(child: null,) : Container(
        margin: EdgeInsets.only(top: 40.0),
        // 거절 시, 나타날 Compo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 거절 이유
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('거절 이유', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                Padding(padding: EdgeInsets.only(bottom: 15.0)),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffEDEDED)),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Text('promise.purpose', style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 40.0)),
            // 2개의 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  child: CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    color: Color(0xffFFDE8F),
                    onPressed: () {
                      _showAlertDialog(context);
                    },
                    child: Text('재요청하기', style: TextStyle(fontSize: 14, color: Colors.black),),
                  ),
                ),
                Container(
                  width: 50,
                  child: CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    color: Color(0xffEDEDED),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소', style: TextStyle(fontSize: 14, color: Colors.black),),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => ReReqPopCom(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemBackground,
          middle: Text('요청결과 내역'),
        ),
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                /* 페이지 설명 부분 */
                Text(
                  '각 접견약속에 대한 승인/거절을\n 확인할 수 있습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                Padding(padding: EdgeInsets.only(bottom: 40.0)),
                /* 승인결과 리스트 */
                Flexible(
                  fit: FlexFit.tight,
                  child: ListView.builder(
                    itemBuilder: (context, pos1) {
                      return GestureDetector(
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
                                          return _showFianlDetailCompo(pos1, pos2, context);
                                        },
                                        itemCount: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: ResItemCom(promise: promiseList[pos1],),
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