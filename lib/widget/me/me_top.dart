import 'package:flutter/material.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:app_model/common/my_constants.dart';

class TopItem extends StatelessWidget {

  final int productNum;
  final Widget contentWidget;
  double _topBarHeight = 90;
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
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/my_bj.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: ScreenUtil.screenWidth,
            height: 282,
          ),
          Opacity(
            opacity: 1,
            child: Column(
              children: <Widget>[
                Container(
                  height: 20,
                  margin: EdgeInsets.only(top: ScreenUtil.statusBarHeight + 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {

                        },
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                Container(
                    height: _topBarHeight,
                    margin: EdgeInsets.only(top: 20),
                    child: _buildTopBar()
                ),
                SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
          Positioned(
            top: 282,
            width: ScreenUtil.screenHeight,
            height: 150,
            child: Container(
              width: ScreenUtil.screenHeight,
              height: 150,
              color: MyColors.mainBgColor,
            ),
          ),
          Positioned(
            top: _topBarHeight + ScreenUtil.statusBarHeight + 100,
            width: ScreenUtil.screenWidth,
            height: 180,
            child: Container(
              margin: EdgeInsets.all(4),
              alignment: Alignment.center,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))), //设置圆角
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        _underDigitalTextOn('总余额（元）', '￥0.00'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {

                              },
                              child: Icon(
                                Icons.settings,
                                color: Color(0xFF4A4A4A),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Color(0xFFD8D8D8),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        _underDigitalTextOn('游戏金额（元）', '￥0.00'),
                        Container(
                          height: 50,
                          width: 1,
                          margin: EdgeInsets.only(top: 12, bottom: 12),
                          color: Color(0xFFD8D8D8),
                        ),
                        _underDigitalTextOn('本地金额（元）', '￥0.00'),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                )
              ),
            ),
          ),
        ]));
  }

  Widget _underDigitalTextOn(count, text) {
    return Column(
//      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 12,
        ),
        Container(
          child: Text(
            '$count',
            style: TextStyle(
              color: Color(0xFF4A4A4A),
              fontSize: 16
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          child: Text(
            text,
            style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 16),
          ),
        ),
        SizedBox(
          height: 12,
        ),
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
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(45)),
              border: Border.all(color: Colors.white, width: 4),
              image: DecorationImage(
                  image: Image.asset(
                    'images/default_nor_avatar.png',
                    fit: BoxFit.fill,
                  ).image)),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          height: 90,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            SizedBox(
              width: 8,
            ),
              Text(
                '账号：' + '12345678',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
              ),
              Text(
                '推荐码：' + '6688',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
