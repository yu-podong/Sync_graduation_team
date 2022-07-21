import 'package:flutter/material.dart';
import 'package:vms/pages/home.dart';

class HostRequestLink extends StatelessWidget {
  const HostRequestLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '방문초대',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: Image.asset('assets/images/home on.png'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Main())); //눌렀을 때 뒤로가기가 아닌 아예 끝내고 싶은데 어떡해야하지??
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text('등록이 완료되었습니다.',
                  style: TextStyle(
                    fontFamily: 'Nato Sans KR',
                  )),
              const Text('해당 방문자에게 승인 메시지가 전달됩니다.',
                  style: TextStyle(
                    fontFamily: 'Nato Sans KR',
                  )),
              const Text('추가적인 정보공유를 원하시면',
                  style: TextStyle(
                    fontFamily: 'Nato Sans KR',
                  )),
              const Text('하단 링크를 이용하세요.',
                  style: TextStyle(
                    fontFamily: 'Nato Sans KR',
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: const SizedBox(
                  width: 350,
                  height: 100,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xffFFF1D1))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/duplicate 1.png')),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/share 1.png')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
