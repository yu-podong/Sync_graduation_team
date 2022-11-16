import 'package:flutter/material.dart';
import '../class/User.dart';

class HosLoginPage extends StatefulWidget {
  const HosLoginPage({Key? key}) : super(key: key);

  @override
  State<HosLoginPage> createState() => _HosLoginPageState();
}

class _HosLoginPageState extends State<HosLoginPage> {
  final _comNumTextEditControllor = TextEditingController();
  final _nameTextEditControllor = TextEditingController();
  late User _loginUser;
  bool _ischeck = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _comNumTextEditControllor.dispose();
    _nameTextEditControllor.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Column(
                    children: const [
                      Text(
                        '방문자 관리 시스템',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Noto Sans KR",
                        ),
                      ),
                      Text(
                        'Visitor Management System',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Noto Sans KR",
                          color: Color(0xff353535),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 59.0),
              // 사원 번호
              Container(
                height: 42.0,
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    filled: true,
                    labelText: '사원번호',
                    fillColor: const Color(0xffF5F5F5),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // 이름
              Container(
                height: 42.0,
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    filled: true,
                    labelText: '이름',
                    fillColor: const Color(0xffF5F5F5),
                  ),
                ),
              ),
              const SizedBox(height: 26.0),
              //로그인
              Container(
                height: 34.0,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 0,
                      primary: const Color(0xffFBC548),
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Noto Sans KR',
                      )),
                ),
              ),
              // 자동 로그인
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Row(
                  children: [
                    Checkbox(value: _ischeck, onChanged: (bool? newIsCheck) {
                      setState((() {
                        _ischeck = newIsCheck!;
                      }));
                    }),
                    const Text('자동 로그인', style: TextStyle(fontSize: 14,
                    color: Color(0xff8D8D8D),),)
                  ],
                )
              )
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
