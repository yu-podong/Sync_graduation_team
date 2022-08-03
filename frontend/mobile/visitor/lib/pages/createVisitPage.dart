import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateVisitPage extends StatefulWidget {
  const CreateVisitPage({Key? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _CreateVisitPage();
  }
}

class _CreateVisitPage extends State<CreateVisitPage> {
  List<Row> visitPurpose = List.empty(growable: true);
  List<String> detailValue1 = List.empty(growable: true);
  List<String> detailValue2 = List.empty(growable: true);
  Column? detailPurposeSection;
  String _selectDetailPurpose = '';
  List<CupertinoDynamicColor> tapColor = List.empty(growable: true);

  @override
  void initState() {
    visitPurpose.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.alarm),
          Text('일반내방', style: TextStyle(fontSize: 18),)
        ],
      )
    );
    visitPurpose.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.alarm),
          Text('공사내방', style: TextStyle(fontSize: 18),)
        ],
      )
    );
    tapColor.add(CupertinoColors.systemBackground);
    tapColor.add(CupertinoColors.systemBackground);

    detailValue1.add('회의');
    detailValue1.add('계약진행');
    detailValue1.add('인터뷰');
    detailValue1.add('직접입력');

    detailValue2.add('보수');
    detailValue2.add('작업목적2');
    detailValue2.add('작업목적3');
    detailValue2.add('작업목적4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Top bar */
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: Text('방문요청'),
      ),
      /* Body */
      body: CupertinoPageScaffold(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /* Page title */
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text('방문목적 입력', style: TextStyle(fontSize: 23),),
              ),
              /* Description */
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Text('000회사에 방문하려는 목적을 선택해주세요.', style: TextStyle(fontSize: 18),),
              ),
              /* Visit purpose list */
              Container(
                  width: double.infinity,
                  height: 100,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDEDEDE)),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children: [
                      // 일반내방
                      GestureDetector(
                        onTap: () {
                          _compose(detailValue1);
                          tapColor[0] = CupertinoColors.systemYellow;
                          tapColor[1] = CupertinoColors.systemBackground;
                        },
                        child: Container(
                          width: double.infinity,
                          height: 49,
                          padding: EdgeInsets.all(0.0),
                          margin: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                              color: tapColor[0],
                              border: Border(
                                  bottom: BorderSide(width: 0.7, color: Color(0xffDEDEDE))
                              )
                          ),
                          child: visitPurpose[0],
                        ),
                      ),
                      // 공사내방
                      GestureDetector(
                        onTap: () {
                          _compose(detailValue2);
                          tapColor[0] = CupertinoColors.systemBackground;
                          tapColor[1] = CupertinoColors.systemYellow;
                        },
                        child: Container(
                          width: double.infinity,
                          height: 49,
                          padding: EdgeInsets.all(0.0),
                          margin: EdgeInsets.all(0.0),
                          color: tapColor[1],
                          child: visitPurpose[1],
                        ),
                      )
                    ],
                  )
              ),
              /* After choosing */
              Padding(
                padding: EdgeInsets.all(0.0),
                child: detailPurposeSection,
              ),
              /* Next button */
              GestureDetector(
                child: Text('다음 >'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/createVisit/hostInfo');
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _compose(valueList) {
    setState(() {
      detailPurposeSection = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('방문목적', style: TextStyle(fontSize: 18),),
          Container(
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    Radio<String>(
                      value: valueList[index],
                      groupValue: _selectDetailPurpose,
                      onChanged: (String? value) {
                        setState(() {
                          _selectDetailPurpose = value!;
                        });
                      },
                    ),
                    Text(valueList[index], style: TextStyle(fontSize: 18),),
                  ],
                );
              },
              itemCount: valueList.length,
            ),
          )
        ],
      );
    });
  }
}