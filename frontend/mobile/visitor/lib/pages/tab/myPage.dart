import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:mobile/class/User.dart';
import 'package:mobile/components/my/myModifyCom.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyPage();
  }
}

class _MyPage extends State<MyPage> {
  User user = User(belong: '충북대학교', position: '학부생', duty: '졸업예정자', name: '유현진', phoneNum: '010-2222-3333');

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('나의 정보'),
      ),
      /* 본문 */
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          /* 사용자 정보 부분 */
          Container(
            height: MediaQuery.of(context).size.height*0.23,
            padding: EdgeInsets.all(30),
            color: Color(0xffFFDE8F),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /* 사용자 사진 */
                Icon(Icons.account_circle, size: 120.0, color: Color(0xff8D8D8D),),
                Padding(padding: EdgeInsets.only(right: 20.0)),
                /* 사용자 정보 */
                Row(
                  children: [
                    /* 사용자 정보 타이틀 */
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* 이름 */
                        Text('이름', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        /* 소속 */
                        Text('소속', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        /* 직위 */
                        Text('직위(직책)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        /* 전화번호 */
                        Text('전화번호', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(right: 20.0)),
                    /* 사용자 데이터 */
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* 이름 */
                        Text(this.user.name, style: TextStyle(fontSize: 14,)),
                        /* 소속 */
                        Text(this.user.belong, style: TextStyle(fontSize: 14,)),
                        /* 직위 */
                        Text('${this.user.position}(${this.user.duty})', style: TextStyle(fontSize: 14,)),
                        /* 전화번호 */
                        Text(this.user.phoneNum, style: TextStyle(fontSize: 14,)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          /* '수정하기' btn */
          CupertinoButton(
            child: Text('수정하기', style: TextStyle(color: Color(0xff8D8D8D)),),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget> [
                    /* 팝업 배경 */
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Color(0xffDEDEDE).withOpacity(0.3),
                      ),
                    ),
                    /* 해당 약속의 세부정보 */
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Color(0xffFFFFFF),
                          width: MediaQuery.of(context).size.width*0.8,
                          height: 230,
                          padding: EdgeInsets.all(25.0),
                          child: MyModifyCom(user: this.user),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
          /* QR 코드 */
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height*0.2,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('출입 QR코드', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  QrImage(
                    data: "${this.user.name} ${this.user.belong}",
                    version: QrVersions.auto,
                    size: 300.0,
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
