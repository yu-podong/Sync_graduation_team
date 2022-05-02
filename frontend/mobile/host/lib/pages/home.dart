import 'package:flutter/material.dart';
import 'package:mobile/components/home_menu_widget.dart';
import 'package:mobile/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _homeMenuList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeMenuWidget(
            type: HomeMenuType.REQUEST,
            text: '요청된 약속 리스트 보기',
            color: Color(0xffFFCBCB)),
        SizedBox(height: 10.0),
        HomeMenuWidget(
            type: HomeMenuType.MY,
            text: '내 약속 리스트 보기',
            color: Color(0xffCBDCFF)),
        SizedBox(height: 10.0),
        HomeMenuWidget(
          type: HomeMenuType.VISITORLOG,
          text: '방문자 방문기록 조회',
          color: Color(0xffC9C9C9),
        ),
        SizedBox(height: 10.0),
        HomeMenuWidget(
          type: HomeMenuType.NOTICE,
          text: '공지사항',
          color: Color(0xffC9C9C9),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //뒤로가기 버튼 없애기
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'TODAY',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ImageData(
                IconsPath.bell,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _homeMenuList(),
        ],
      ),
    );
  }
}
