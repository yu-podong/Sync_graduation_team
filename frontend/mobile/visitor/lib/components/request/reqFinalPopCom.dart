import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReqFinalPopCom extends StatelessWidget {
  // 접견약속의 세부정보를 담는 변수
  const ReqFinalPopCom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 접견약속의 세부내용 overlay
    return CupertinoAlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /* 팝업 내용 */
          Text(
            '해당 호스트에게 요청하신 \n접견약속이 전송되었습니다.\n\n승인 여부는 \'요청내역\'에서 \n확인하세요.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            //Navigator.of(context).pushReplacementNamed('/');
          },
          child: const Text('확인', style: TextStyle(fontSize: 14),),
        ),
      ],
    );
  }
}