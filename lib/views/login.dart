import 'package:flutter/material.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:app_model/common/screen_util.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              brightness: Brightness.dark,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(0)
        ),
        body: Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/login/login_bj.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.screenHeight,
          child: Column(
            children: <Widget>[
              _appBar(),
//            Expanded(child: body),
            ],
          ),
        )
    );
  }

  Widget _appBar() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.all(0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Text('登录', style: TextStyle(fontSize: 18, color: Colors.white)),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}