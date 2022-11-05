import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/class/User.dart';

class MyModifyCom extends StatefulWidget {
  final User user;
  const MyModifyCom({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyModifyCom();
  }
}

class _MyModifyCom extends State<MyModifyCom> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /* 사용자 정보 타이틀 */
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* 이름 */
            Text('이름', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            /* 소속 */
            Text('소속', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            /* 직위 */
            Text('직위(직책)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            /* 전화번호 */
            Text('전화번호', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: 20.0)),
        /* 사용자 데이터 */
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* 이름 */
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffEDEDED)),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Text(widget.user.name, style: TextStyle(fontSize: 14),),
            ),
            /* 소속 */
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffEDEDED)),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Text(widget.user.belong, style: TextStyle(fontSize: 14),),
            ),
            /* 직위 */
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffEDEDED)),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Text('${widget.user.position}(${widget.user.duty})', style: TextStyle(fontSize: 14),),
            ),
            /* 전화번호 */
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffEDEDED)),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Text(widget.user.phoneNum, style: TextStyle(fontSize: 14),),
            ),
          ],
        ),
      ],
    );
  }
}
