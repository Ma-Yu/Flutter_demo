import 'package:flutter/material.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:app_model/widget/login/login_signIn.dart';
import 'package:app_model/widget/login/login_dynamic.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  PageController _pageController;
  PageView _pageView;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _pageView = new PageView(
      controller: _pageController,
      children: <Widget>[
        SignInPage(),
        DynamicPage(),
      ],
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

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
        body: GestureDetector(
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView (
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/login/login_bj.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight - ScreenUtil.statusBarHeight,
              child: Column(
                children: <Widget>[
                  _appBar(),
                  Expanded(child: _content()),
                ],
              ),
            ),
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

  Widget _content() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //设置渐变的背景
      decoration: new BoxDecoration(

      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new SizedBox(
            height: 20,
          ),
          new Container(
            width: 300,
            height: 50,
//            color: MyColors.themeColor,
            child: new Row(
              children: <Widget>[

                Expanded(
                    child: new Container(
                      width: 90,
                      decoration: _currentPage == 0
                          ? BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.white, width: 4)),
                      )
                          : null,
                      child: new Center(
                        child: new FlatButton(
                          onPressed: () {
                            _pageController.animateToPage(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          },
                          child: new Text(
                            "快速登录",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                new SizedBox(
                  width: 40,
                ),
                Expanded(
                    child: new Container(
                      decoration: _currentPage == 1
                          ? BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.white, width: 4)),

                      )
                          : null,
                      child: new Center(
                        child: new FlatButton(
                          onPressed: () {
                            _pageController.animateToPage(1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          },
                          child: new Text(
                            "动态码登录",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),

          new Expanded(child: _pageView),
        ],
      ),
    );
  }
}