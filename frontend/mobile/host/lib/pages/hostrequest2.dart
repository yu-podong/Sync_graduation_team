import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/components/buttons.dart';
import 'package:vms/pages/HostRequest3.dart';

class HostRequest2 extends StatefulWidget {
  HostRequest2({Key? key}) : super(key: key);

  @override
  State<HostRequest2> createState() => _HostRequest2State();
}

class _HostRequest2State extends State<HostRequest2> {
  DateTime selectedDate = DateTime.now();
  String? _selectedTime;

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
        locale: const Locale('ko'),
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

  Future<void> _selectTime() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            '방문초대',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Image.asset('assets/images/bell-ring 1.png'),
                onPressed: () {}),
          ]),
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text('방문 날짜 입력',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nato Sans KR',
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Row(
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
                        style: TextStyle(fontWeight: FontWeight.bold),
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
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                const Text('입실시간',
                    style: TextStyle(
                      fontFamily: 'Nato Sans KR',
                    )),
                EleButton(
                  text: const Text('시간',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontFamily: 'Noto Sans KR')),
                  width: 60.0,
                  height: 30.0,
                  color: Color(0xffFFDC89),
                  radius: 5.0,
                  onPressed: () {
                    _selectTime();
                  },
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text('퇴실시간',
                    style: TextStyle(
                      fontFamily: 'Nato Sans KR',
                    )),
                EleButton(
                  text: const Text('시간',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontFamily: 'Noto Sans KR')),
                  width: 60.0,
                  height: 30.0,
                  color: const Color(0xffFFDC89),
                  radius: 5.0,
                  onPressed: () {
                    _selectTime();
                  },
                )
              ],
            ),
          ),
          TextButton(
            child: const Text('다음 >'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HostRequest3()));
            },
          ),
        ]),
      ),
    );
  }
}
