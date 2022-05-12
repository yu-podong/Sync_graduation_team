import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/bottom_nav_controller.dart';
import 'package:mobile/pages/myList.dart';
import 'package:mobile/pages/notice.dart';
import 'package:mobile/pages/requestedList.dart';
import 'package:mobile/pages/visitorLog.dart';

enum HomeMenuType { REQUEST, MY, VISITORLOG, NOTICE }

class HomeMenuWidget extends StatelessWidget {
  HomeMenuType type;
  String text;
  Color? color;
  double? width = double.infinity;
  double? height = 45;

  HomeMenuWidget({
    Key? key,
    required this.type,
    required this.text,
    required this.color,
    this.width,
    this.height,
  }) : super(key: key);

  Widget requestWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const RequestedList());
        },
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            )),
        style: ElevatedButton.styleFrom(
          primary: this.color,
        ),
      ),
    );
  }

  Widget myWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: () {
          Get.to(MyList(), binding: BindingsBuilder(() {
            Get.put(BottomNavController());
          }));
        },
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            )),
        style: ElevatedButton.styleFrom(
          primary: this.color,
        ),
      ),
    );
  }

  Widget visitorLogWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const VisitorLog());
        },
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            )),
        style: ElevatedButton.styleFrom(
          primary: this.color,
        ),
      ),
    );
  }

  Widget noticeWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const Notice());
        },
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            )),
        style: ElevatedButton.styleFrom(
          primary: this.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case HomeMenuType.REQUEST:
        return requestWidget();
      case HomeMenuType.MY:
        return myWidget();
      case HomeMenuType.VISITORLOG:
        return visitorLogWidget();
      case HomeMenuType.NOTICE:
        return noticeWidget();
    }
  }
}
