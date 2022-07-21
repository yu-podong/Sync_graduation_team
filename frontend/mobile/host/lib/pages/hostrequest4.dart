import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/components/buttons.dart';
import 'package:get/get.dart';
import 'package:vms/pages/hostrequestlink.dart';

class HostRequest4 extends StatefulWidget {
  @override
  State<HostRequest4> createState() => _HostRequest4State();
}

class _HostRequest4State extends State<HostRequest4> {
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
                  colorScheme: const ColorScheme.light(
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
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
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
                      Container(
                        margin: const EdgeInsets.all(30),
                        child: const Text('최종 확인',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nato Sans KR',
                            )),
                      ),
                      const Text('요청하고자 하는 방문약속의 정보가',
                          style: TextStyle(
                            fontFamily: 'Nato Sans KR',
                          )),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: const Text('정상적으로 입력되었는 지 확인해주세요.',
                            style: TextStyle(
                              fontFamily: 'Nato Sans KR',
                            )),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text('방문자 이름',
                                    style: TextStyle(
                                      fontFamily: 'Nato Sans KR',
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 32.0,
                                  width: 238.0,
                                  child: TextFormField(
                                    //방문자 이름 텍스트 필드
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFFDC89)),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text('방문자 소속',
                                    style: TextStyle(
                                      fontFamily: 'Nato Sans KR',
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 32.0,
                                  width: 238.0,
                                  child: TextFormField(
                                    //방문자 소속 텍스트 필드
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFFDC89)),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text('방문자 직위',
                                    style: TextStyle(
                                      fontFamily: 'Nato Sans KR',
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 32.0,
                                  width: 238.0,
                                  child: TextFormField(
                                    //방문자 직위 텍스트 필드
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFFDC89)),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text('방문 날짜',
                                    style: TextStyle(
                                      fontFamily: 'Nato Sans KR',
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '${selectedDate.toLocal()}'.split(' ')[0],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                //날짜 버튼
                                EleButton(
                                  text: const Text(
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
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text('입실 시간',
                                    style: TextStyle(
                                      fontFamily: 'Nato Sans KR',
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 32.0,
                                  width: 238.0,
                                  child: TextFormField(
                                    //입실 시간 텍스트 필드
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFFDC89)),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text('퇴실 시간',
                                    style: TextStyle(
                                      fontFamily: 'Nato Sans KR',
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 32.0,
                                  width: 238.0,
                                  child: TextFormField(
                                    //퇴실 시간 텍스트 필드
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFFDC89)),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text('방문 장소',
                                    style: TextStyle(
                                      fontFamily: 'Nato Sans KR',
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 32.0,
                                  width: 238.0,
                                  child: TextFormField(
                                    //방문 장소 텍스트 필드
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFFDC89)),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: EleButton(
                          //생성하기 버튼
                          height: 50.0,
                          text: const Text(
                            '생성하기',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.bold),
                          ),
                          color: const Color(0xffFFDE8F),
                          radius: 5.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HostRequestLink()));
                          },
                        ),
                      )
                    ],
                  )),
                ),
              ));
        }));
  }
}
