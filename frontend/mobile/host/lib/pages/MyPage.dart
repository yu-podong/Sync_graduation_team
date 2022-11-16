import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile/class/User.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyPage();
  }
}

class _MyPage extends State<MyPage> {
  User user = User(
      belong: '충북대학교',
      position: '학부생',
      duty: '졸업예정자',
      name: '송승우',
      phoneNum: '010-2222-3333');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          '나의 정보',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      /* 본문 */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          /* 사용자 정보 부분 */
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            padding: const EdgeInsets.all(30),
            color: const Color(0xffFFDE8F),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /* 사용자 사진 */
                Icon(
                  Icons.account_circle,
                  size: 70.0,
                  color: Color(0xff8D8D8D),
                ),
                const Padding(padding: EdgeInsets.only(right: 20.0)),
                /* 사용자 정보 */
                Row(
                  children: [
                    /* 사용자 정보 타이틀 */
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        /* 이름 */
                        Text('이름',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        /* 소속 */
                        Text('소속',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        /* 직위 */
                        Text('직위(직책)',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        /* 전화번호 */
                        Text('전화번호',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(right: 20.0)),
                    /* 사용자 데이터 */
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* 이름 */
                        Text(this.user.name,
                            style: const TextStyle(
                              fontSize: 14,
                            )),
                        /* 소속 */
                        Text(this.user.belong,
                            style: const TextStyle(
                              fontSize: 14,
                            )),
                        /* 직위 */
                        Text('${this.user.position}(${this.user.duty})',
                            style: const TextStyle(
                              fontSize: 14,
                            )),
                        /* 전화번호 */
                        Text(this.user.phoneNum,
                            style: const TextStyle(
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          /* QR 코드 */
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                //height: MediaQuery.of(context).size.height*0.2,
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '출입 QR코드',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    QrImage(
                      data: "${this.user.name} ${this.user.belong}",
                      version: QrVersions.auto,
                      size: 250.0,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
