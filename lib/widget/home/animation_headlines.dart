import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_model/widget/home/animation_text.dart';

List headlines = [
  'MT大白洗碗机测评：用了就再也回不去了',
  '我与MT大白洗碗机的蜗居生活',
  '太平洋电脑网每日早报，10月25日份，请查收',
  '新版手机天猫上线！逛街时可以摇出红包！赶紧更新吧',
  '天猫双11手机&配件预售会场满减大促'
];

class AnimationHeadlinesWidget extends StatefulWidget {
  @override
  _AnimationHeadlinesWidgetState createState() => _AnimationHeadlinesWidgetState();
}

class _AnimationHeadlinesWidgetState extends State<AnimationHeadlinesWidget> {

  int _diffScaleNext = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer _countdownTimer = new Timer.periodic(new Duration(seconds: 3), (timer) {
//      print('countdownTimer.tick');
      if(mounted){
        setState(() {
          _diffScaleNext++;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
      SizedBox(
        width: 8,
      ),
      Image.asset('images/ic_home_new.png',width: 30.0,height: 30.0),
      SizedBox(
        width: 8,
      ),
      Container(
//              color: bgColor,
        child: DiffScaleText(
          text: headlines[_diffScaleNext % headlines.length],
          textStyle: TextStyle(fontSize: 12, color: Colors.black),
        ),
        height: 30,
        alignment: Alignment.centerLeft,
        width: 40,
      ),
      SizedBox(
        width: 8,
      ),
      Container(
//        width: 60,
//        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: (){

          },
          child: Container(
            width: 60,
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: Color(0xFFedeeed), width: 1)),
            ),
            child: new Text('更多', style: new TextStyle(fontSize: 14)),
          ),
        ),
      ),
//      GestureDetector(
//        onTap: (){
//
//        },
//        child: Container(
//          padding: EdgeInsets.only(left: 14),
//          decoration: BoxDecoration(
//            border: Border(left: BorderSide(color: Color(0xFFedeeed), width: 1)),
//          ),
//          child: new Text('更多', style: new TextStyle(fontSize: 14)),
//        ),
//      ),
    ],
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
