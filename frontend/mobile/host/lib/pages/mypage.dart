import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, //뒤로가기 버튼 없애기
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              'My Page',
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 411,
                height: 185,
                color: const Color(0xffFFDE8F),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(children: [
                    const Text('내 약속 정보',
                        style: TextStyle(fontFamily: 'Nato Sans KR')),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          '내 약속 조회/관리',
                          style: TextStyle(color: Colors.black),
                        ))
                  ])),
              const Text('방문기록 정보',
                  style: TextStyle(fontFamily: 'Nato Sans KR')),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '방문기록 통계로 보기',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '방문기록 조회',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              const Text('설정', style: TextStyle(fontFamily: 'Nato Sans KR')),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '공지사항',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '알림 및 소리',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '계정 정보 관리',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '오픈소스 라이선스',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    '버전 정보 v1.0.0',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
        onWillPop: () {
          return Future(() => false);
        });
  }
}
