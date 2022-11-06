import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class/User.dart';

class VisLoginPage extends StatefulWidget {
  const VisLoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VisLoginPage();
  }
}

class _VisLoginPage extends State<VisLoginPage> {
  final _belogTextEditControllor = TextEditingController();
  final _posTextEditControllor = TextEditingController();
  final _dutyTextEditControllor = TextEditingController();
  final _nameTextEditControllor = TextEditingController();
  final _phoneNumTextEditControllor = TextEditingController();
  late User _loginUser;
  bool _ischeck = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _belogTextEditControllor.dispose();
    _posTextEditControllor.dispose();
    _dutyTextEditControllor.dispose();
    _nameTextEditControllor.dispose();
    _phoneNumTextEditControllor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFDE8F),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* 로그인 타이틀 */
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 70.0),
              child: Column (
                children: <Widget>[
                  Text('방문자 관리시스템', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text('Visitor Management System', style: TextStyle(fontSize: 25,)),
                ],
              ),
            ),
            /* 로그인 입력 form */
            Form(
              child: Column(
                children: [
                  /* 소속 */
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CupertinoTextField(
                      controller: _belogTextEditControllor,
                      padding: EdgeInsets.all(15.0),
                      textAlign: TextAlign.center,
                      placeholder: '소속',
                      placeholderStyle: TextStyle(color: Color(0xff8D8D8D)),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        border: Border.all(color: Color(0xffFFFFFF)),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  /* 직위 & 직책 */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: CupertinoTextField(
                          controller: _posTextEditControllor,
                          padding: EdgeInsets.all(15.0),
                          textAlign: TextAlign.center,
                          placeholder: '직위',
                          placeholderStyle: TextStyle(color: Color(0xff8D8D8D)),
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Color(0xffFFFFFF)),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: CupertinoTextField(
                          controller: _dutyTextEditControllor,
                          padding: EdgeInsets.all(15.0),
                          textAlign: TextAlign.center,
                          placeholder: '직책',
                          placeholderStyle: TextStyle(color: Color(0xff8D8D8D)),
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Color(0xffFFFFFF)),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* 이름 */
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CupertinoTextField(
                      controller: _nameTextEditControllor,
                      padding: EdgeInsets.all(15.0),
                      textAlign: TextAlign.center,
                      placeholder: '이름',
                      placeholderStyle: TextStyle(color: Color(0xff8D8D8D)),
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          border: Border.all(color: Color(0xffFFFFFF)),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  /* 전화번호 */
                  Container(
                    width: double.infinity,
                    child: CupertinoTextField(
                      controller: _phoneNumTextEditControllor,
                      padding: EdgeInsets.all(15.0),
                      textAlign: TextAlign.center,
                      placeholder: '전화번호',
                      placeholderStyle: TextStyle(color: Color(0xff8D8D8D)),
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          border: Border.all(color: Color(0xffFFFFFF)),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 40.0)),
                  Container(
                    width: double.infinity,
                    child: CupertinoButton(
                      onPressed: () {
                        _loginUser = User(
                          belong: _belogTextEditControllor.text,
                          position: _posTextEditControllor.text,
                          duty: _dutyTextEditControllor.text,
                          name: _nameTextEditControllor.text,
                          phoneNum: _phoneNumTextEditControllor.text
                        );

                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      color: Color(0xffFBC548),
                      padding: EdgeInsets.all(15.0),
                      child: Text('로그인', style: TextStyle(color: Color(0xff000000)),),
                    ),
                  )
                ],
              ),
            ),
            /* 자동 로그인 checkbox */
            Container(
              child: Row(
                children: [
                  Checkbox(
                      value: _ischeck,
                      onChanged: (bool? newIsCheck) {
                        setState(() {
                          _ischeck = newIsCheck!;
                        });
                      }
                  ),
                  Text('자동 로그인', style: TextStyle(fontSize: 16),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}