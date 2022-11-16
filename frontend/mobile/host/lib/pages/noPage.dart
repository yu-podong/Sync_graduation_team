import 'package:flutter/material.dart';
import 'package:mobile/pages/noticeReadPage.dart';

import '../../class/Notice.dart';
import '../../components/noItemCom.dart';

class NoPage extends StatefulWidget {
  const NoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NoPage();
  }
}

class _NoPage extends State<NoPage> {
  final List<Notice> noList = [
    Notice(
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
감사합니다.'''),
    Notice(
        title: '[긴급] 공지사항에 사진 및 파일 여부 결정',
        date: '2022.10.10',
        time: '10:23',
        level: 2,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
즉, component를 잘 만드시면 재활용할 수 있습니다.
또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
(다만, 아직 무엇을 사용할 지 정하지 못했습니다.
그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
당장은 이거밖에 생각 안나네요..ㅎ
감사합니다.'''),
    Notice(
        title: '[] 표시는 ‘긴급’과 ‘필독’ 사항만 표시 (색상도 동일하게)',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
즉, component를 잘 만드시면 재활용할 수 있습니다.
또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
(다만, 아직 무엇을 사용할 지 정하지 못했습니다.
그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
당장은 이거밖에 생각 안나네요..ㅎ
감사합니다.'''),
    Notice(
        title:
            '공지사항 제목을 표시할 때, 최대 라인 수는 2줄로 고정 필수/공지사항 제목을 표시할 때, 최대 라인 수는 2줄로/공지사항 제목을 표시할 때, 최대 라인 수는 2줄로 ...',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
즉, component를 잘 만드시면 재활용할 수 있습니다.
또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
(다만, 아직 무엇을 사용할 지 정하지 못했습니다.
그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
당장은 이거밖에 생각 안나네요..ㅎ
감사합니다.'''),
    Notice(
        title: '참고로, 공지사항은 관리자만 작성하기에 작성자 표시 없음',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
즉, component를 잘 만드시면 재활용할 수 있습니다.
또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
(다만, 아직 무엇을 사용할 지 정하지 못했습니다.
그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
당장은 이거밖에 생각 안나네요..ㅎ
감사합니다.'''),
    Notice(
        title: '참고로, 공지사항은 관리자만 작성하기에 작성자 표시 없음',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
즉, component를 잘 만드시면 재활용할 수 있습니다.
또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
(다만, 아직 무엇을 사용할 지 정하지 못했습니다.
그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
당장은 이거밖에 생각 안나네요..ㅎ
감사합니다.'''),
    Notice(
        title: '참고로, 공지사항은 관리자만 작성하기에 작성자 표시 없음',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: '참고로, 공지사항은 관리자만 작성하기에 작성자 표시 없음',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: '참고로, 공지사항은 관리자만 작성하기에 작성자 표시 없음',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: '참고로, 공지사항은 관리자만 작성하기에 작성자 표시 없음',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: 'NoticeTitle',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: 'NoticeTitle',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: 'NoticeTitle',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: 'NoticeTitle',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
    Notice(
        title: 'NoticeTitle',
        date: '2022.10.10',
        time: '10:23',
        level: 3,
        content:
            '''NoticeTitle에서 사용한 Listitem에서 borderline만 Top -> bottom으로 변경했습니다.
            즉, component를 잘 만드시면 재활용할 수 있습니다.
            또한, 공지사항 폰트 크기는 날짜 폰트 크기와 동일하며, 해당 프로젝트에서 사용하는 모든 폰트 스타일을 동일합니다.
            (다만, 아직 무엇을 사용할 지 정하지 못했습니다.
            그리고, 항상 Topbar와 Bottombar는 현재 위치에 고정되어야 합니다.
            이 모든 내용은 figma에서 시뮬레이션을 돌려보시면 됩니다.
            당장은 이거밖에 생각 안나네요..ㅎ
            감사합니다.'''),
  ];
  Color noItemBackColor = const Color(0xffFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          '공지사항',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, pos) {
            if (this.noList[pos].level == 1) {
              noItemBackColor = const Color(0xffFFDE8F);
            }
            // 긴급 & 일반 공지사항인 경우
            else {
              noItemBackColor = const Color(0xffFFFFFF);
            }

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/notice/read');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: noItemBackColor,
                    border: const Border(
                        bottom: BorderSide(
                      width: 0.7,
                      color: Color(0xffDEDEDE),
                    ))),
                child: NoItemCom(notice: this.noList[pos]),
              ),
            );
          },
          itemCount: this.noList.length,
        ),
      ),
    );
  }
}
