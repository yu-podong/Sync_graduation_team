import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class/Promise.dart';

class TodayItemCom extends StatefulWidget {
  // Today의 각 item에 담길 정보
  final Promise promise;
  const TodayItemCom({Key? key, required this.promise}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TodayItemCom();
  }
}

class _TodayItemCom extends State<TodayItemCom> {

  @override
  Widget build(BuildContext context) {
    // Today list의 item component
    return Container(
      width: double.infinity, // width: 100%
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff8D8D8D)),
        ),
      ),
      child: Column(
        children: <Widget>[
          // 접견자 정보
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Icon(Icons.account_circle, size: 30.0, color: Color(0xffC4C4C4),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(widget.promise.hostName, style: TextStyle(fontSize: 16),)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(widget.promise.position, style: TextStyle(fontSize: 10,color: Color(0xff5A5A5A)),),
                    )
                  ],
                )
              ],
            ),
          ),
          // 접견 장소
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('접견 장소', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(widget.promise.place),
                )
              ],
            ),
          ),
          // 방문 날짜
          Container(
            margin: EdgeInsets.only(bottom:  10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('방문 날짜', style: TextStyle(color: Color(0xff5A5A5A)),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(widget.promise.time),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}