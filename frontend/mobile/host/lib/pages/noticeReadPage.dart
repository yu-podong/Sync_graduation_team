import 'package:flutter/material.dart';

import '../../class/Notice.dart';
import '../../components/noItemCom.dart';

class NoticeReadPage extends StatefulWidget {
  const NoticeReadPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NoticeReadPage();
  }
}

class _NoticeReadPage extends State<NoticeReadPage> {
  Notice notice = Notice(
      title: '[필독] 000기업 방문자 관리 시스템 사용 시 유의사항',
      date: '2022.10.10',
      time: '10:23',
      level: 1,
      content:
          '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
          
즉, component를 잘 만드시면 재활용할 수 있습니다.

또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
(다만, 아직 무엇을 사용할 지 정하지 못했습니다.

그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.

당장은 이거밖에 생각 안나네요..ㅎ

감사합니다.''');
  List<Widget> noComList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    // 공지사항 페이지에서 선택한 공지의 정보를 매개변수로 전달받음
    //final args = ModalRoute.of(context)!.settings.arguments as Notice;

    noComList = [
      /* 공지사항 제목  */
      Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 0.7,
          color: Color(0xffDEDEDE),
        ))),
        child: NoItemCom(notice: this.notice),
      ),
      /* 공지사항 내용 */
      Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Text(
          this.notice.content,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      )
    ];

    return Scaffold(
       appBar: AppBar(
          title: const Text(
            '공지사항',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.0),
          ),
          leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.black,
            icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, pos) {
            return this.noComList[pos];
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
