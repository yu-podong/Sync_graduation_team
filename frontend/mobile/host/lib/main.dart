import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vms/pages/home.dart';
import 'package:vms/components/buttons.dart';
import 'package:vms/pages/navibar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Flutter Demo',
      material: (_, __) => MaterialAppData(
          theme: ThemeData(
        backgroundColor: const Color(0xffFFDE8F),
      )),
      cupertino: (_, __) => CupertinoAppData(),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    bool _isChecked = false;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: const Color(0xffFFDE8F),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //상단 로고
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(width: 10.0),
                  Column(
                    children: const <Widget>[
                      Text(
                        '방문자 관리 시스템',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Noto Sans KR",
                        ),
                      ),
                      Text(
                        'Visitor Management System',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Noto Sans KR",
                          color: Color(0xff353535),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              //ID 입력창
              Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    labelText: '사원번호',
                    fillColor: const Color(0xffF5F5F5),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              //로그인
              EleButton(
                text: const Text(
                  '로그인',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: 'Noto Sans KR'),
                ),
                width: 370,
                height: 40,
                color: const Color(0xffFBC548),
                radius: 5.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NaviBar()));
                },
              ),
              //자동 로그인
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const Text('자동 로그인'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //뒤로 가기 눌렀을때 앱종료
      onWillPop: () async {
        return false;
      },
    );
  }
}
