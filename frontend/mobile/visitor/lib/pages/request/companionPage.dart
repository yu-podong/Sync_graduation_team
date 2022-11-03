// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CompanionPage extends StatefulWidget {
  const CompanionPage({Key? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _CompanionPage();
  }
}

class _CompanionPage extends State<CompanionPage> {
  bool _isCompanion = false;

  Widget? _isShowLinkBox() {
    if(_isCompanion == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('동행자 정보 등록 링크', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              Text('아래의 링크를 동행자에게 공유하여, 정보를 등록하도록 진행해주시기 바랍니다.', style: TextStyle(fontSize: 16,)),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10.0)),
          CupertinoButton(
            padding: EdgeInsets.all(15.0),
            borderRadius: null,
            color: Color(0xffFFF1D1),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: 'https://www.figma.com/file/jHBGdd1t4Y0l9qAdVVxTet/Untitled?node-id=3A73'));
              showToast();
            },
            child: Text(
              'https://www.figma.com/file/jHBGdd1t4Y0l9qAdVVxTet/Untitled?node-id=3A73',
              style: TextStyle(fontSize: 16, color: Color(0xff000000)),
              softWrap: true,
            ),
          ),
        ],
      );
    }
    else {
      return null;
    }
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: '해당 링크가 복사되었습니다.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xffDEDEDE),
      textColor: Colors.black,
      fontSize: 14.0
    );
  }

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Top bar */
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('방문요청'),
      ),
      body: CupertinoPageScaffold(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
            // '다음 버튼을 absolute로 배치하기 위한 작업
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /* Page title */
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: Text('동행자 정보 입력', style: TextStyle(fontSize: 24),),
                    ),
                    /* Description */
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '해당 접견의 동행자 여부를 선택해주세요.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    /* 2개의 Radio btn */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio<bool>(
                              value: true,
                              groupValue: _isCompanion,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isCompanion = value!;
                                });
                              },
                            ),
                            Text('있음', style: TextStyle(fontSize: 16),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio<bool>(
                              value: false,
                              groupValue: _isCompanion,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isCompanion = value!;
                                });
                              },
                            ),
                            Text('없음', style: TextStyle(fontSize: 16),),
                          ],
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 40.0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.7, color: Color(0xffDEDEDE))
                        )
                      ),
                      child: _isShowLinkBox(),
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Text('다음 >', style: TextStyle(fontSize: 20),),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/createVisit/final');
                      },
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}