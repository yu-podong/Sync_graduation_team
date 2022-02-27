import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/components/image_data.dart';

class Join extends StatelessWidget {
  const Join({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              ImageData(IconsPath.logo,width: 100),
              SizedBox(width: 10.0),
              Column(
                children: <Widget>[
                  Text('방문자 관리 시스템',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Noto Sans KR",
                      color: Color(0xff353535),
                    ),),
                  Text('Visitor Management System',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Noto Sans KR",
                      color: Color(0xff353535),
                    ),),
                ],
              ),
            ],
          ),
          backgroundColor: Color(0xffFFDE8F),
          elevation: 0.0,
        ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        //스크롤은 컬럼혹은 로우 형태여야됨
        child: Column(
          children: [
            //노랑배경
            Container(
              height: 2000, //스크롤길이
              width: Size.infinite.width, //넓이 앱최대
              color: Color(0xffFFDE8F),
              //하얀배경
              child: Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom:25.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Text(
                      '본인정보',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          height: 35.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled:true,
                              labelText: '이름',
                              fillColor: Color(0xffF5F5F5),
                            ),
                          ),
                        )
                    ),
                    Container(
                      height: 35.0,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        child: Text('가입하기',
                          style: TextStyle(
                            color: Color(0xff000000),
                          ),),
                        onPressed: (){
                          Get.toNamed('/login');},
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 0,
                            primary: Color(0xffF9CB5C),
                            textStyle: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'Noto Sans KR',
                            )
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}