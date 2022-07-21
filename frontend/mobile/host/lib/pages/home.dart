import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vms/components/buttons.dart';
import 'package:vms/pages/MyPromise.dart';
import 'package:vms/pages/hostrequest1.dart';
import 'package:vms/pages/newrequestlist.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //뒤로가기 버튼 없애기
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'TODAY',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                icon: Image.asset('assets/images/bell-ring 1.png'),
                onPressed: () {}),
          ],
        ),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            width: 320,
            height: 290,
            color: const Color(0xffFFDE8F),
          ),
          Row(
            children: [
              //신규 접수내역 버튼
              Container(
                margin: const EdgeInsets.fromLTRB(50, 30, 0, 0),
                child: EleButton(
                  text: const Text(
                    '신규 접수내역',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontFamily: 'Noto Sans KR'),
                  ),
                  width: 90,
                  height: 80,
                  color: const Color(0xffFFD3AB),
                  radius: 5.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewRequestList()));
                  },
                ),
              ),
              //승인내역 버튼
              Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: EleButton(
                  text: const Text(
                    '승인내역',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontFamily: 'Noto Sans KR'),
                  ),
                  width: 90,
                  height: 80,
                  color: const Color(0xffffd3ab),
                  radius: 5.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPromise()));
                  },
                ),
              ),
              //방문기록 조회 버튼
              Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: EleButton(
                  text: const Text(
                    '방문기록 조회',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                        fontFamily: 'Noto Sans KR'),
                  ),
                  width: 90,
                  height: 80,
                  color: const Color(0xffffd3ab),
                  radius: 5.0,
                  onPressed: () {},
                ),
              ),
            ],
          )
        ]),
        //플로팅 버튼
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HostRequest1()));
          },
          label: const Text(
            '+',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      onWillPop: () {
        return Future(() => false);
      },
    );
  }
}
