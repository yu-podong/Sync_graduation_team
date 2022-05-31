import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          /* TODAY */
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'TODAY',
              style: TextStyle(fontSize: 25),
            ),
          ),
          /* 당일 잡혀있는 약속을 보여주는 부분 */
          Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Container(
                width: 400,
                height: 400,
                color: CupertinoColors.systemYellow.withOpacity(0.5),
              )
          ),
          /* 3개의 메뉴버튼 */
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('신청내역'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('승인결과 내역'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('방문이력'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
