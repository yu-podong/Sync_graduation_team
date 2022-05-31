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
          children: <Widget>[
            Icon(CupertinoIcons.clock),
            Text('일반내방')
          ],
        )
    );
    visitPurpose.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(CupertinoIcons.wrench),
            Text('공사내방')
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /* Page title */
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('방문목적 입력', style: TextStyle(fontSize: 20),),
            ),
            /* Description */
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Text('000회사에 방문하려는 목적을 선택해주세요.'),
            ),
            /* Visit purpose list */
            Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Card(
                          color: tapColor[index],
                          child: visitPurpose[index],
                        ),
                        onTap: () {
                          if(index == 0) {
                            _compose(detailValue1);
                            tapColor[0] = CupertinoColors.systemYellow;
                            tapColor[1] = CupertinoColors.systemBackground;
                          }
                          else {
                            _compose(detailValue2);
                            tapColor[0] = CupertinoColors.systemBackground;
                            tapColor[1] = CupertinoColors.systemYellow;
                          }
                        },
                      );
                    },
                    itemCount: visitPurpose.length,
                  ),
                )
            ),
            /* After choosing */
            Padding(
              padding: EdgeInsets.all(0.0),
              child: detailPurposeSection,
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: GestureDetector(
                child: Text('다음 >'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/createVisit/hostInfo');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _compose(valueList) {
    setState(() {
      detailPurposeSection = Column(
        children: <Widget>[
          Text('방문목적'),
          Container(
            height: 400,
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
                    Text(valueList[index]),
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