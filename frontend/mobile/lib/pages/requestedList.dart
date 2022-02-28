import 'package:flutter/material.dart';
import 'package:mobile/components/appointmentWidget.dart';

class RequestedList extends StatelessWidget {
  const RequestedList({Key? key}) : super(key: key);

  Widget _requestedList() {
    return Column(
      children: [
        AppointmentWidget(
          type: AppointmentType.REQUEST,
          name: '이지민',
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          '요청된 약속관리',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //스크롤은 컬럼혹은 로우 형태여야됨
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 1000,
              child: _requestedList(),
            )
          ],
        )
      ),
    );
  }
}


