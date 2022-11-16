import 'package:flutter/material.dart';

import '../../class/Promise.dart';


class ReqItemCom extends StatefulWidget {
  // 접견약속의 세부정보를 담는 변수
  final Promise promise;
  const ReqItemCom({Key? key, required this.promise}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReqItemCom();
  }
}

class _ReqItemCom extends State<ReqItemCom> {

  @override
  Widget build(BuildContext context) {
   /* 요청한 약속 정보 */
    return Container(
      margin:  const EdgeInsets.only(bottom: 30.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 3,color: const Color(0xffEDEDED)),
        borderRadius: const BorderRadius.all(Radius.circular(7.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /* 방문자 정보 */
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(widget.promise.visitName, style: TextStyle(fontSize: 16),)
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(widget.promise.position, style: const TextStyle(fontSize: 10, color: Color(0xff8D8D8D)),),
                      )
                    ],
                  )
                ],
              )
          ),
          /* 접견장소 */
          Container(
            margin: const EdgeInsets.only(left: 40.0, bottom: 10.0),
            child: Row(
              children: [
                Text('접견장소', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                Text('promise.접견장소', style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
          /* 접견날짜 */
          Container(
            margin: const EdgeInsets.only(left: 40.0, bottom: 10.0),
            child: Row(
              children: const [
                Text('접견날짜', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                /* 년 */
                Text('2022.11.12', style: TextStyle(fontSize: 14,)),
              ],
            ),
          ),
          /* 접견시간 */
          Container(
            margin: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: const [
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
