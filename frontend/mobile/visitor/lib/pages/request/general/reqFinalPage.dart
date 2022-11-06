import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/components/proDetailCom.dart';
import 'package:mobile/components/request/reqFinalPopCom.dart';

import '../../../class/Promise.dart';


class ReqFinalPage extends StatefulWidget {
  const ReqFinalPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReqFinalPage();
  }
}

class _ReqFinalPage extends State<ReqFinalPage> {
  List<Widget> _finalCom = List<Widget>.empty();

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => ReqFinalPopCom(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _finalCom = <Widget> [
      /* Page title */
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30.0),
        child: Text('최종 확인', style: TextStyle(fontSize: 23),),
      ),
      /* Description */
      Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: Text(
          '요청하고자하는 방문약속의 정보\n정상적으로 입력되었는지 확인해주세요.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      /* Visit Info */
      ProDetailCom(promise: Promise(hostName: '접견자 이름1', position: '직위1', place: 'S4-1 114호', date: '2022.11.21', time: '14:00 ~ 16:00')),
      Padding(padding: EdgeInsets.only(bottom: 50.0)),
      /* '생성하기' btn */
      Container(
        width: double.infinity,
        child: CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          color: Color(0xffFFDE8F),
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text('생성하기', style: TextStyle(fontSize: 16, color: Colors.black),),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Top bar */
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('방문요청'),
      ),
      body: CupertinoPageScaffold(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return _finalCom[position];
            },
            itemCount: _finalCom.length,
          ),
        ),
      ),
    );
  }
}