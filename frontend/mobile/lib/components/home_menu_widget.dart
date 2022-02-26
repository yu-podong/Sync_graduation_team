import 'package:flutter/material.dart';

enum HomeMenuType {REQUEST,MY,VISITORLOG,NOTICE}

class HomeMenuWidget extends StatelessWidget {
  HomeMenuType type;
  String text;
  Color? color;
  double? width=double.infinity;
  double? height=45;

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
        onPressed: (){},
        child: Align(
          alignment: Alignment.centerLeft,
            child: Text(
                this.text,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),)
        ),
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
        onPressed: (){},
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),)
        ),
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
        onPressed: (){},
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),)
        ),
        style: ElevatedButton.styleFrom(
          primary: this.color,
        ),
      ),
    );
  }

  Widget noticeWidget() {
    return Container(
      child: ElevatedButton(
        onPressed: (){},
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),)
        ),
        style: ElevatedButton.styleFrom(
          primary: this.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch(type){
      case HomeMenuType.REQUEST:
        return requestWidget();
        break;
      case HomeMenuType.MY:
        return myWidget();
        break;
      case HomeMenuType.VISITORLOG:
        return visitorLogWidget();
        break;
      case HomeMenuType.NOTICE:
        return noticeWidget();
        break;
    }
    return Container();
  }


}
