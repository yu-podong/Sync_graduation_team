import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VisitFinalPage extends StatefulWidget {
  const VisitFinalPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VisitFinalPage();
  }
}

class _VisitFinalPage extends State<VisitFinalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Top bar */
      appBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('방문요청'),
      ),
      body: CupertinoPageScaffold(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* Page title */
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                child: Text('최종 확인', style: TextStyle(fontSize: 23),),
              ),
              /* Description */
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  '요청하고자하는 방문약속의 정보\n정상적으로 입력되었는지 확인해주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              /* Visit Info */
              // Host info part
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    // host name
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("접견자 이름", style: TextStyle(fontSize: 15),),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("host name", style: TextStyle(fontSize: 15),),
                          )
                        ],
                      ),
                    ),
                    // host group
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("접견자 소속", style: TextStyle(fontSize: 15),),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("host group", style: TextStyle(fontSize: 15),),
                          )
                        ],
                      ),
                    ),
                    // host position
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("접견자 직위", style: TextStyle(fontSize: 15),),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("host position", style: TextStyle(fontSize: 15),),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ),
              // Visit date part
              Container(
                child: Column(
                  children: [
                    // visit date
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("방문 날짜", style: TextStyle(fontSize: 15),),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("수정 필요", style: TextStyle(fontSize: 15),),
                          )
                        ],
                      ),
                    ),
                    // time to enter
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("입실 시간", style: TextStyle(fontSize: 15),),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("14:00", style: TextStyle(fontSize: 15),),
                          )
                        ],
                      ),
                    ),
                    // time to leave
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("입실 시간", style: TextStyle(fontSize: 15),),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("16:00", style: TextStyle(fontSize: 15),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}