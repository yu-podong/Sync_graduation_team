import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/buttons.dart';
import 'package:mobile/controller/party_button_controller.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/addsecond.dart';

class Add extends StatefulWidget {
  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        helpText: '약속 날짜를 선택하세요.',
        cancelText: '취소',
        confirmText: '확인',
        errorFormatText: '알맞는 날짜 형태를 입력해주세요.',
        fieldLabelText: '약속 날짜를 선택하세요.',
        locale: Locale('ko'),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Color(0xffFFDC89),
                    onPrimary: Colors.black,
                    onSurface: Colors.black,
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                    primary: Colors.black,
                  ))),
              child: child!);
        });
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumDate: DateTime(2000),
              maximumDate: DateTime(2025),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PartyButtonController());

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            '신규약속 생성',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Nato Sans KR'),
          ),
        ),
        body: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Container(
                  child: Form(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Text('방문자 이름',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 32.0,
                            width: 238.0,
                            child: TextFormField(
                              //방문자 이름 텍스트 필드
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFFDC89)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('방문자 소속',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 32.0,
                            width: 238.0,
                            child: TextFormField(
                              //방문자 소속 텍스트 필드
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFFDC89)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('방문 목적',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 32.0,
                            width: 238.0,
                            child: TextFormField(
                              //방문자 목적 텍스트 필드
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFFDC89)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('방문 날짜',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              )),
                          Text(
                            '${selectedDate.toLocal()}'.split(' ')[0],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          EleButton(
                            //동행인 추가하기 버튼
                            text: Text(
                              '날짜',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                  fontFamily: 'Noto Sans KR'),
                            ),
                            width: 60.0,
                            height: 30.0,
                            color: Color(0xffFFDC89),
                            radius: 5.0,
                            onPressed: () => _selectDate(context),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('입실 시간',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text('퇴실 시간',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text('방문 목적',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 32.0,
                            width: 238.0,
                            child: TextFormField(
                              //방문자 목적 텍스트 필드
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFFDC89)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('방문 장소',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 32.0,
                            width: 238.0,
                            child: TextFormField(
                              //방문자 장소 텍스트 필드
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFFDC89)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('방문자 전화번호',
                              style: TextStyle(
                                fontFamily: 'Nato Sans KR',
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 32.0,
                            width: 238.0,
                            child: TextFormField(
                              //방문자 전화번호 텍스트 필드
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffFFDC89)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        //방문자 전화번호와 버튼 간격 띄우기
                        height: 50,
                      ),
                      EleButton(
                        //동행인 추가하기 버튼
                        text: Text(
                          '동행인 추가하기',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'Noto Sans KR'),
                        ),
                        width: 126.0,
                        height: 30.0,
                        color: Color(0xffFFDC89),
                        radius: 5.0,
                        onPressed: () {
                          controller.addParty();
                        },
                      ),
                      SizedBox(
                        //동행자 버튼과 생성하기 버튼 간격 띄우기
                        height: 30.0,
                      ),
                      EleButton(
                        //생성하기 버튼
                        height: 50.0,
                        text: Text(
                          '생성하기',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.bold),
                        ),
                        color: Color(0xffC6FFC5),
                        radius: 5.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addSecond()));
                        },
                      )
                    ],
                  )),
                ),
              ));
        }));
  }
}
