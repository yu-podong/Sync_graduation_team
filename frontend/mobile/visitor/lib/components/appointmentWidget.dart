import 'package:flutter/material.dart';

enum AppointmentType { REQUEST, MY }

class AppointmentWidget extends StatelessWidget {
  AppointmentType type;
  String name;
  String? company;
  String? purpose;
  String? date;

  AppointmentWidget({
    Key? key,
    required this.type,
    required this.name,
    this.company,
    this.purpose,
    this.date,
  }) : super(key: key);

  Widget requestWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      padding: EdgeInsets.all(4.0),
      width: Size.infinite.width,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xffFFDC89),
      ),
      child: Container(
        padding:
            EdgeInsets.only(left: 15.0, top: 5.0, right: 15.0, bottom: 5.0),
        width: Size.infinite.width,
        height: Size.infinite.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //방문자이름
            Row(
              children: [
                Text(
                  '방문자 이름:',
                ),
                SizedBox(width: 10.0),
                Text(
                  this.name,
                )
              ],
            ),
            //방문자 소속
            Row(
              children: [
                Text('방문자 소속:'),
                SizedBox(width: 10.0),
                Text(
                  this.name,
                )
              ],
            ),
            //방문목적
            Row(
              children: [
                Text('방문 목적:'),
                SizedBox(width: 23.0),
                Text(
                  this.name,
                )
              ],
            ),
            //방문날짜
            Row(
              children: [
                Text('방문 날짜:'),
                SizedBox(width: 23.0),
                Text(
                  this.name,
                )
              ],
            ),
            //버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //승인버튼
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  height: 22,
                  width: 75,
                  child: ElevatedButton(
                    child: Text(
                      '승인',
                      style: TextStyle(
                        color: Color(0xff000000),
                      ),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 0,
                        primary: Color(0xffFFD062),
                        textStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Noto Sans KR',
                        )),
                  ),
                ),
                SizedBox(width: 10.0),
                //거부버튼
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  height: 22,
                  width: 75,
                  child: ElevatedButton(
                    child: Text(
                      '거부',
                      style: TextStyle(
                        color: Color(0xff000000),
                      ),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 0,
                        primary: Color(0xffB0B0B0),
                        textStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Noto Sans KR',
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget myWidget() {
    return Container(
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppointmentType.REQUEST:
        return requestWidget();
      case AppointmentType.MY:
        return myWidget();
    }
  }
}
