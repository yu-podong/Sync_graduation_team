import 'package:flutter/material.dart';
import 'package:mobile/class/User.dart';

class MyModifyCom extends StatefulWidget {
  final User user;

  const MyModifyCom({Key? key, required this.user}) : super(key: key);

  @override
  State<MyModifyCom> createState() => _MyModifyComState();
}

class _MyModifyComState extends State<MyModifyCom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 사용자 정보 다티틀
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // 이름
            Text(
              '이름',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // 소속
            Text(
              '소속',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // 직위
            Text(
              '직위(직책)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // 전화번호
            Text(
              '전화번호',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(right: 20.0)),
        // 사용자 데이터
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이름
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child:
                  Text(widget.user.name, style: const TextStyle(fontSize: 14)),
            ),
            // 소속
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child:
                  Text(widget.user.name, style: const TextStyle(fontSize: 14)),
            ),
            // 직위
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child:
                  Text(widget.user.name, style: const TextStyle(fontSize: 14)),
            ),
            // 전화번호
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child:
                  Text(widget.user.name, style: const TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ],
    );
  }
}
