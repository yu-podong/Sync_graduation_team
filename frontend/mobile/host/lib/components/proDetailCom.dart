import 'package:flutter/material.dart';
import '../class/Promise.dart';

class ProDetailCom extends StatefulWidget {
  //접견 약속의 세부정보를 담는 변수
  final Promise promise;
  const ProDetailCom({Key? key, required this.promise}) : super(key: key);

  @override
  State<ProDetailCom> createState() => _ProDetailCom();
}

class _ProDetailCom extends State<ProDetailCom> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 접견자 정보
        Container(
          margin: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('접견자 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
               Row(
                children: [
                  Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(widget.promise.hostName, style: const TextStyle(fontSize: 16),),
                    ),
                     Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(widget.promise.hostName, style: const TextStyle(fontSize: 16),),
                    ),
                  ],)
                ],
               )
            ],
          ),
        ),
        // 접견 목적
        Container(
          margin: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('접견 목적', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                decoration: BoxDecoration(border: Border.all(color: const Color(0xffEDEDED)),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Text('promise.purpose', style: TextStyle(fontSize: 14),),
              ),
            ],
          ),
        ),
        // 접견약속 정보
        Container(
          margin: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('접견약속 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              // 접견 날짜
              Row(children: [
                const Text('접견날짜', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                const Padding(padding: EdgeInsets.only(right: 20.0)),
                // 년
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  child: const Text('2022', style: TextStyle(fontSize: 14),),
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                const Text('년', style: TextStyle(fontSize: 13, color: Color(0xff000000)),),
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                // 월
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  child: const Text('12', style: TextStyle(fontSize: 14),),
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                const Text('월', style: TextStyle(fontSize: 13, color: Color(0xff000000)),),
                const Padding(padding: EdgeInsets.only(right: 10.0)),
                // 일
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  child: const Text('31', style: TextStyle(fontSize: 14),),
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                ),
                const Padding(padding: EdgeInsets.only(right: 5.0)),
                const Text('일', style: TextStyle(fontSize: 13, color: Color(0xff000000)),),
              ],),
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              // 접견시간
              Row(children: [
                const Text('접견시간', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                const Padding(padding: EdgeInsets.only(right: 20.0)),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Text(widget.promise.time, style: const TextStyle(fontSize: 14),),
                ),
              ],),
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              // 접견장소
              Row(children: [
                const Text('접견장소', style: TextStyle(fontSize: 14, color: Color(0xff5A5A5A)),),
                const Padding(padding: EdgeInsets.only(right: 20.0)),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xffEDEDED)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Text('promise.접견장소', style: const TextStyle(fontSize: 14),),
                ),
              ],),
            ]),
        ),
        // 방문자 정보
        Container(
          margin: const EdgeInsets.only(bottom: 40.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('방문자 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const Padding(padding: EdgeInsets.only(bottom: 15.0)),
            Row(children: [
              const Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
            Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(widget.promise.visitName, style: const TextStyle(fontSize: 16),),
              ),
                            Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(widget.promise.position, style: const TextStyle(fontSize: 10, color: Color(0xff8D8D8D)),),
              ),
            ],)],)
          ]),
        ),
        // 동행자 정보
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('동행자 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              Row(children: [
                const Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                       child: Text(widget.promise.visitName, style: const TextStyle(fontSize: 16),),
                    ),
                    Container(
                       margin: const EdgeInsets.only(left: 10),
                       child: Text(widget.promise.position, style: const TextStyle(fontSize: 10, color: Color(0xff8D8D8D)),),
                    ),
                  ],)
              ],),
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              Row(children: [
                 const Icon(Icons.account_circle, size: 30.0, color: Color(0xff8D8D8D),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(widget.promise.visitName, style: const TextStyle(fontSize: 16),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(widget.promise.position, style: const TextStyle(fontSize: 10, color: Color(0xff8D8D8D)),),
                    ),
                  ],
                )
              ],)
            ]),
        ),
      ],
    );
  }
}