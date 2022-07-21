import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
          automaticallyImplyLeading: false, //뒤로가기 버튼 없애기
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Notice',
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
        )),
        onWillPop: () {
          return Future(() => false);
        });
  }
}
