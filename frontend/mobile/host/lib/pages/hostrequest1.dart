import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vms/pages/HostRequest2.dart';

class HostRequest1 extends StatefulWidget {
  const HostRequest1({Key? key}) : super(key: key);

  @override
  State<HostRequest1> createState() => _HostRequest1State();
}

class _HostRequest1State extends State<HostRequest1> {
  List people = [];
  List original = [];
  TextEditingController txtQuery = TextEditingController();

//json 파일읽어오는 함수
  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/jsons/people.json');
    var json = jsonDecode(jsonStr);

    people = json;
    original = json;

    setState(() {});
  }

//searchbar 구현함수 나중에 한글 인식하는 거 추가해야함
  void search(String query) {
    if (query.isEmpty) {
      people = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    print(query);
    List result = [];
    people.forEach((p) {
      var name = p["name"].toString().toLowerCase();
      if (name.contains(query)) {
        result.add(p);
      }
    });

    people = result;
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
              margin: const EdgeInsets.all(30),
              child: const Text('방문자 정보 입력',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nato Sans KR',
                  )),
            ),
            const Text('이전에 방문한 기록이 있던 방문자의 정보입니다.',
                style: TextStyle(
                  fontFamily: 'Nato Sans KR',
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Text('원하는 방문자를 클릭해주세요.',
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
            _listView(people),
            Container(
              margin: EdgeInsets.fromLTRB(300, 0, 0, 10),
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
                      MaterialPageRoute(builder: (context) => HostRequest2()));
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
Widget _listView(people) {
  return Expanded(
      child: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            var person = people[index];
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xffFFDE8F),
              ),
              title: Row(children: [
                Expanded(child: Text(person['name'])),
                Expanded(child: Text(person['department'])),
                Expanded(child: Text(person['position']))
              ]),
              onTap: () {},
            );
          }));
}
