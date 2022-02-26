import 'package:flutter/material.dart';

class Join extends StatelessWidget {
  const Join({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenC'),
      ),
      body: Center(
        child: Text('ScreenC',
          style: TextStyle(
              fontSize: 24.0
          ),
        ),
      ),
    );
  }
}