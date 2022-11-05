import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/class/Promise.dart';

class VisItemCom extends StatelessWidget {
  final Promise promise;
  // 접견약속의 세부정보를 담는 변수
  const VisItemCom({Key? key, required this.promise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 접견약속의 세부내용 overlay
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.5,color: Color(0xffFFDE8F)),
          borderRadius: BorderRadius.all(Radius.circular(7.0))
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(this.promise.hostName, style: TextStyle(fontSize: 14),),
          Text(this.promise.position, style: TextStyle(fontSize: 14),),
          Text(this.promise.date, style: TextStyle(fontSize: 14),),
          Text(this.promise.time, style: TextStyle(fontSize: 14),),
        ],
      ),
    );
  }
}