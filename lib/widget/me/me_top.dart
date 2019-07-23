import 'package:flutter/material.dart';
import 'package:app_model/common/screen_util.dart';

class TopItem extends StatelessWidget {

  final int productNum;
  final Widget contentWidget;
  double _topBarHeight = 48;
  BuildContext _context;

  static Gradient primaryGradient = const LinearGradient(colors: [Colors.blue, Colors.blueAccent]);

  TopItem({Key key, this.productNum = 0, this.contentWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
        child: Stack(children: <Widget>[
          Container(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/my_bj.png"),
                  fit: BoxFit.cover,
                ),
              ),
//                color: Theme.of(context).primaryColor,
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight / 4,
            ),
          ),
          Opacity(
            opacity: 1,
            child: Container(
//              height: _topBarHeight,
              margin: EdgeInsets.only(top: ScreenUtil.statusBarHeight + 20),
//          color: Colors.red,
              child: Column(
                children: <Widget>[
                  Opacity(
                    opacity: 1,
                    child: _buildTopBar(),
                  ),

                  Stack(
                    children: <Widget>[
                      Container(
                        height: 20,
                        decoration: BoxDecoration(gradient: primaryGradient),
                      ),
                      Container(
//                    decoration: BoxDecoration(gradient: GZXColors.primaryGradient),

//            color: Colors.red,
                          padding: EdgeInsets.all(4),
//              padding: EdgeInsets.only(top: 20,bottom: 20),
                          alignment: Alignment.center,
                          child: Card(
                            elevation: 0,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                            //设置圆角
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    'static/images/88vip.png',
                                    height: 40,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 14),
                                    decoration: BoxDecoration(
                                      border: Border(left: BorderSide(color: Color(0xFFedeeed), width: 1)),
//                              color: Colors.red,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '兑天猫超市5元代金券',
                                              style: TextStyle(color: Color(0xFF666666)),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              '会员专享 每周可兑',
                                              style: TextStyle(color: Color(0xFF666666), fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'static/images/card.png',
                                    height: 44,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: _topBarHeight + ScreenUtil.statusBarHeight + 30,
              height: 367,
              width: ScreenUtil.screenWidth,
              child: Container())
        ]));
  }

  Widget _underDigitalTextOn(count, text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
//          color: Colors.blue,
          child: Text(
            '$count',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
//          color: Colors.blue,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        )
      ],
    );
  }

  Widget _circleButton(Color imageBackgroundColor, IconData iconData, text, int unreadMessages) {
    return Container(
//      color: Colors.red,
      width: 50,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
//        mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: imageBackgroundColor,
                  radius: 22,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6a6a6a),
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              right: 0,
              child: Container(
//                width: 18.0,
//                height: 18.0,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(20 / 2.0),
                    color: Color(0xffff3e3e)),
                child: Text(
                  '${unreadMessages}',
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 8,
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: Colors.white, width: 1),
              image: DecorationImage(
                  image: Image.asset(
                    'images/default_nor_avatar.png',
                    fit: BoxFit.fill,
                  ).image)),
//          child: Image.asset(GZXIcons.huangjiaju, fit: BoxFit.fill,),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
//          color: Colors.blue,
          height: 60,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '账号：' + '12345678',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                '推荐码：' + '6688',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {

            },
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
