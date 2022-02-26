import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xffFFDE8F),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //상단 로고
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png'),
                  SizedBox(width: 10.0),
                  Column(
                    children: <Widget>[
                      Text('방문자 관리 시스템',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Noto Sans KR",
                      ),),
                      Text('Visitor Management System',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Noto Sans KR",
                        color: Color(0xff353535),
                      ),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              //ID 입력창
              Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled:true,
                    labelText: 'UserId',
                    fillColor: Color(0xffF5F5F5),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              //Password 입력창
              Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled:true,
                    labelText: 'Password',
                    fillColor: Color(0xffF5F5F5),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              //로그인
              Container(
                height: 45.0,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  child: Text('Login',
                  style: TextStyle(
                    color: Color(0xff000000),
                  ),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/home');},
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    elevation: 0,
                    primary: Color(0xffFBC548),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Noto Sans KR',
                    )
                  ),
                ),
              ),
              //회원가입
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/join');},
                    child: Text('회원가입')
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false; //뒤로 가기 눌렀을때 앱종료
      },
    );
  }
}
