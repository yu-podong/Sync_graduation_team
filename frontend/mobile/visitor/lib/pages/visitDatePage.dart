import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class VisitDatePage extends StatefulWidget {
  const VisitDatePage({Key? key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _VisitDatePage();
  }
}

class _VisitDatePage extends State<VisitDatePage>{
  // 캘린더 설정 시, 필요한 변수들
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // 입실 & 퇴실시간 설정 시, 필요한 변수들
  DateTime time = DateTime(2016, 5, 10, 22, 35);

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
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
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /* Page title */
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Text('방문날짜 입력', style: TextStyle(fontSize: 23),),
                    ),
                    /* Description */
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Text('방문하려는 날짜와 시간을 입력해주세요.', style: TextStyle(fontSize: 18),),
                    ),
                    /* 캘린더 - https://pub.dev/packages/table_calendar */
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        // 사용자가 선택한 날짜를 focus할 수 있도록
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay; // update `_focusedDay` here as well
                          });
                        },
                        // 사용자가 선택한 날짜 데이터가 보여지는 달이 바뀌어도 유지되도록
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                      ),
                    ),
                    /* 입실시간 - https://api.flutter.dev/flutter/cupertino/CupertinoDatePicker-class.html */
                    Container(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: CupertinoColors.label.resolveFrom(context),
                          fontSize: 18.0,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _DatePickerItem(
                                children: <Widget>[
                                  const Text('입실시간'),
                                  CupertinoButton(
                                    // Display a CupertinoDatePicker in time picker mode.
                                    onPressed: () => _showDialog(
                                      CupertinoDatePicker(
                                        initialDateTime: time,
                                        mode: CupertinoDatePickerMode.time,
                                        use24hFormat: true,
                                        // This is called when the user changes the time.
                                        onDateTimeChanged: (DateTime newTime) {
                                          setState(() => time = newTime);
                                        },
                                      ),
                                    ),
                                    // In this example, the time value is formatted manually. You can use intl package to
                                    // format the value based on the user's locale settings.
                                    child: Text(
                                      '${time.hour}시 ${time.minute}분',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /* 퇴실시간 */
                    Container(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: CupertinoColors.label.resolveFrom(context),
                          fontSize: 18.0,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _DatePickerItem(
                                children: <Widget>[
                                  const Text('퇴실시간'),
                                  CupertinoButton(
                                    // Display a CupertinoDatePicker in time picker mode.
                                    onPressed: () => _showDialog(
                                      CupertinoDatePicker(
                                        initialDateTime: time,
                                        mode: CupertinoDatePickerMode.time,
                                        use24hFormat: true,
                                        // This is called when the user changes the time.
                                        onDateTimeChanged: (DateTime newTime) {
                                          setState(() => time = newTime);
                                        },
                                      ),
                                    ),
                                    // In this example, the time value is formatted manually. You can use intl package to
                                    // format the value based on the user's locale settings.
                                    child: Text(
                                      '${time.hour}시 ${time.minute}분',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Text('다음 >', style: TextStyle(fontSize: 20),),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/createVisit/visitSpace');
                      },
                    )
                )
              ]
            ),
        ),
      ),
    );
  }
}

// This class simply decorates a row of widgets.
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}