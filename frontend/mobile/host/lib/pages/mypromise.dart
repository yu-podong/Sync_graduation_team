import 'package:flutter/material.dart';

class MyPromise extends StatefulWidget {
  const MyPromise({Key? key}) : super(key: key);

  @override
  State<MyPromise> createState() => _MyPromise();
}

class _MyPromise extends State<MyPromise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            '승인내역',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Image.asset('assets/images/bell-ring 1.png'),
                onPressed: () {}),
          ]),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
