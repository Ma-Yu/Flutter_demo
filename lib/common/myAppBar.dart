import 'package:flutter/material.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:app_model/views/login.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      color: MyColors.themeColor,
      padding: EdgeInsets.only(top: statusBarHeight, left: 0, right: 0, bottom: 0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: ScreenUtil.screenWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 90,
                ),
                Text('标题', style: TextStyle(fontSize: 18, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => LoginPage())
                        );
                      },
                      child: Image.asset('images/home/ic_home_login.png',height: 40, width: 40),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('注册点击'),
                              );
                            }
                        );
                      },
                      child: Image.asset('images/home/ic_home_registered.png',height: 40, width: 40),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
