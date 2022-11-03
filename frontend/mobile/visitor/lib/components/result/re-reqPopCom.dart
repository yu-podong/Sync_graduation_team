import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReReqPopCom extends StatelessWidget {
  // 접견약속의 세부정보를 담는 변수
  const ReReqPopCom({Key? key}) : super(key: key);

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
            '재요청한 접견약속을 해당\n 접견자에게 전송했습니다.\n\n자세한 정보는 \‘요청내역\'에서 확인해\n주시기 바랍니다.',
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