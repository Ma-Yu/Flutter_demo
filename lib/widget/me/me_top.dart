import 'package:flutter/material.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:app_model/common/my_constants.dart';

class TopItem extends StatelessWidget {

  final int productNum;
  final Widget contentWidget;
  double _topBarHeight = 90;
  BuildContext _context;

  TopItem({Key key, this.productNum = 0, this.contentWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    double _statusH;
    if (ScreenUtil.statusBarHeight == 20) {
      _statusH = ScreenUtil.statusBarHeight + 20;
    } else {
      _statusH = ScreenUtil.statusBarHeight;
    };
    return Container(
        child: Stack(children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/me/my_bj.png"),
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
                  margin: EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color:Colors.transparent,
                        child: IconButton(
                            color: Colors.white,
                            highlightColor: Colors.black12,
                            icon: ImageIcon(AssetImage('images/me/ic_my_message.png')),
                            onPressed: (){
                              print('点击事件');
                            }
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
                  height: 240 - _statusH,
                )
              ],
            ),
          ),
          Positioned(
            top: 282,
            width: ScreenUtil.screenWidth,
            height: 150,
            child: Container(
              width: ScreenUtil.screenWidth,
              height: 150,
              color: MyColors.mainBgColor,
            ),
          ),
          Positioned(
            top: _topBarHeight + 120,
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
                              child: Image.asset('images/me/ic_my_refresh.png',height: 25, width: 25),
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
