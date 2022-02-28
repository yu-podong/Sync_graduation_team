import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/personInfoWidget.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/party_button_controller.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PartyButtonController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          '신규약속 생성',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 1000,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 130),
                height: 25,
                width: Size.infinite.width,
                child: ElevatedButton(
                  child: Text('동행인 추가하기',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),),
                  onPressed: (){controller.addParty();},
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 0,
                      primary: Color(0xffFFDC89),
                      textStyle: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Noto Sans KR',
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

}
