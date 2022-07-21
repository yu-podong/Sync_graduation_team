import 'package:flutter/material.dart';

class NewRequestList extends StatefulWidget {
  const NewRequestList({Key? key}) : super(key: key);

  @override
  State<NewRequestList> createState() => _NewRequestListState();
}

class _NewRequestListState extends State<NewRequestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            '신규 접수내역',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Image.asset('assets/images/bell-ring 1.png'),
                onPressed: () {}),
          ]),
      body: Center(
        child: Column(
          children: const [
            Text('000님께 요청된 방문내역입니다.',
                style: TextStyle(
                  fontFamily: 'Nato Sans KR',
                )),
            Text('내용을 확인하시고, 승인여부를 결정해주세요.',
                style: TextStyle(
                  fontFamily: 'Nato Sans KR',
                )),
          ],
        ),
      ),
    );
  }
}
