import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'TODAY',
          style: TextStyle(
              color: Color(0xff000000)),
        ),
        actions: [
          IconButton(icon: Icon(Icons.alarm),onPressed: null),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //요청된 약속리스트 보기
            Container(
              height: 45.0,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('요청된 약속 리스트 보기',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/home');},
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 0,
                    primary: Color(0xffFFCBCB),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Noto Sans KR',
                    )
                ),
              ),
            ),
            //내 약속리스트 보기
            Container(
              height: 45.0,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('내 약속 리스트 보기',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/home');},
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 0,
                    primary: Color(0xffB4CDFF),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Noto Sans KR',
                    )
                ),
              ),
            ),
            //방문자 방문기록 조회
            Container(
              height: 45.0,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('방문자 방문기록 조회',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/home');},
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 0,
                    primary: Color(0xffD8D8D8),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Noto Sans KR',
                    )
                ),
              ),
            ),
            //공지사항
            Container(
              height: 45.0,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('공지사항',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/home');},
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 0,
                    primary: Color(0xffD8D8D8),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Noto Sans KR',
                    )
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Home'
          ),
        ],
      ),
    );
  }
}
