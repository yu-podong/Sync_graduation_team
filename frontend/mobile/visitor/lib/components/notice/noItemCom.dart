import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../class/Notice.dart';

class NoItemCom extends StatelessWidget {
  final Notice notice;
  const NoItemCom({Key? key, required this.notice}) : super(key: key);

  Color _decideNoticeTitleColor() {
    // 필독 공지사항인 경우
    if(this.notice.level == 1) {
      return Color(0xff0A1AAD);
    }
    // 긴급 공지사항인 경우
    else if(this.notice.level == 2) {
      return Color(0xffFF0E0E);
    }
    // 일반 공지사항인 경우
    else {
      return Color(0xff000000);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* 공지사항 타이틀 */
        Text(
          this.notice.title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _decideNoticeTitleColor()
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10.0),),
        /* 공지사항 작성일자 */
        Text(
          '${this.notice.date} ${this.notice.time}',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff000000),
          ),
        ),
      ],
    );
  }
}