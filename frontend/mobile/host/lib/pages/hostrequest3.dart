import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vms/pages/HostRequest4.dart';

class HostRequest3 extends StatefulWidget {
  const HostRequest3({Key? key}) : super(key: key);

  @override
  State<HostRequest3> createState() => _HostRequest3State();
}

class _HostRequest3State extends State<HostRequest3> {
  List seminars = [];
  List original = [];
  TextEditingController txtQuery = TextEditingController();

//json 파일읽어오는 함수
  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/jsons/seminars.json');
    var json = jsonDecode(jsonStr);

    seminars = json;
    original = json;

    setState(() {});
  }

//searchbar 구현함수 나중에 한글 인식하는 거 추가해야함
  void search(String query) {
    if (query.isEmpty) {
      seminars = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    print(query);
    List result = [];
    seminars.forEach((p) {
      var num = p["num"].toString().toLowerCase();
      if (num.contains(query)) {
        result.add(p);
      }
    });

    seminars = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

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
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: (() {
            FocusScope.of(context).unfocus();
          }),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(30),
              child: const Text('접견장소 선택',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nato Sans KR',
                  )),
            ),
            const Text('000 회사내의 세미나실 입니다.',
                style: TextStyle(
                  fontFamily: 'Nato Sans KR',
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Text('접견장소로 사용 할 곳을 선택해주세요.',
                  style: TextStyle(
                    fontFamily: 'Nato Sans KR',
                  )),
            ),
            SingleChildScrollView(
              child: TextFormField(
                cursorColor: Color(0xffFFDE8F),
                autofocus: false,
                controller: txtQuery,
                onChanged: search,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xffFFDE8F),
                    )),
                    hintText: "검색",
                    focusColor: const Color(0xffFFDE8F),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xffFFDE8F),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Color(0xffFFDE8F),
                      ),
                      onPressed: () {
                        txtQuery.text = '';
                        search(txtQuery.text);
                      },
                    )),
              ),
            ),
            _listView(seminars),
            Container(
              margin: const EdgeInsets.fromLTRB(300, 0, 0, 10),
              child: TextButton(
                child: const Text(
                  '다음 >',
                  style: TextStyle(
                      fontFamily: 'Nato Sans KR',
                      fontSize: 17,
                      color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HostRequest4()));
                },
              ),
            ),
          ]),
        );
      }),
    );
  }
}

//리스트 뷰 보여주는 함수
Widget _listView(seminars) {
  return Expanded(
      child: ListView.builder(
          itemCount: seminars.length,
          itemBuilder: (context, index) {
            var room = seminars[index];
            return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffFFDE8F),
                ),
                title: Row(children: [
                  Expanded(child: Text(room['num'])),
                  Expanded(child: Text(room['name'])),
                  Expanded(child: Text(room['state']))
                ]));
          }));
}
