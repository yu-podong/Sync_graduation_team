import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../class/promise.dart';


class ResItemCom extends StatefulWidget {
  // 접견약속의 세부정보를 담는 변수
  final Promise promise;
  const ResItemCom({Key? key, required this.promise}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResItemCom();
  }
}

class _ResItemCom extends State<ResItemCom> {


  @override
  Widget build(BuildContext context) {
    /* 요청한 약속 정보 */
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(width: 3,color: Color(0xffFFDE8F)),
          borderRadius: BorderRadius.all(Radius.circular(7.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /* 접견자 정보 & 승인여부*/
          Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(widget.promise.hostName, style: TextStyle(fontSize: 16),)
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(widget.promise.position, style: TextStyle(fontSize: 10, color: Color(0xff8D8D8D)),),
                          )
                        ],
                      ),
                    ],
                  ),
                  widget.promise.isOK ?
                    Text('승인', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff33A553)),) :
                    Text('거절', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xffC02828)),)
                ],
              )
          ),
          /* 접견장소 */
          Container(
            margin: EdgeInsets.only(left: 40.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                Text('접견장소', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                Text(widget.promise.place, style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
          /* 접견날짜 */
          Container(
            margin: EdgeInsets.only(left: 40.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                Text('접견날짜', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                Text(widget.promise.date, style: TextStyle(fontSize: 14,)),
              ],
            ),
          ),
          /* 접견시간 */
          Container(
            margin: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('접견시간', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                Text('22:00 ~ 23:00', style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}