import 'package:flutter/material.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:app_model/common/screen_util.dart';
import 'dart:async';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => new _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode focusScopeNode = new FocusScopeNode();

  GlobalKey<FormState> _DynamicFormKey = new GlobalKey();

  String _CountText="获取验证码";
  Timer _CountDownTimer;

  @override
  void dispose() {
    // TODO: implement dispose
    _CountDownTimer?.cancel();
    _CountDownTimer = null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 22, right: 30, bottom: ScreenUtil.screenHeight - 520),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          buildSignInTextForm(),

        ],
      ),
    );
  }

  Widget buildSignInTextForm() {
    return Form(
      key: _DynamicFormKey,
      //开启自动检验输入内容，最好还是自己手动检验，不然每次修改子孩子的TextFormField的时候，其他TextFormField也会被检验，感觉不是很好
//        autovalidate: true,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Image.asset(
                        'images/login/ic_login_user.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        //关联焦点
                        focusNode: emailFocusNode,
                        cursorColor: MyColors.themeColor,
                        onEditingComplete: () {
                          if (focusScopeNode == null) {
                            focusScopeNode = FocusScope.of(context);
                          }
                          focusScopeNode.requestFocus(passwordFocusNode);
                        },

                        decoration: new InputDecoration(
                            hintText: "请输入手机号码",
                            hintStyle: TextStyle(fontSize: 18, color: Color(0xFFA5A5A5)),
                            border: InputBorder.none
                        ),
                        style: new TextStyle(fontSize: 18, color: Colors.black),
                        //验证
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email can not be empty!";
                          }
                        },
                        onSaved: (value) {

                        },
                      ),
                    )
                  ],
                )
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(
                left: 20, right: 20, top: 0),
            height: 1,
            color: Color(0xFFEBE9E9),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Image.asset(
                      'images/login/ic_login_password.png',
                      width: 25,
                      height: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      focusNode: passwordFocusNode,
                      cursorColor: MyColors.themeColor,
                      decoration: new InputDecoration(
                          hintText: "请输入动态码",
                          hintStyle: TextStyle(fontSize: 18, color: Color(0xFFA5A5A5)),
                          border: InputBorder.none
                      ),
                      //输入密码，需要用*****显示
                      style: new TextStyle(fontSize: 18, color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 6) {
                          return "Password'length must longer than 6!";
                        }
                      },
                      onSaved: (value) {

                      },
                    ),
                  ),
                  OutlineButton(
                      onPressed: _CountText=="获取验证码"? timeCount : null,
                      borderSide: new BorderSide(color: MyColors.themeColor),
                      highlightedBorderColor: MyColors.themeColor,
                      child: new Text(_CountText),
                      textColor: MyColors.themeColor,
                  ),
                ],
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(
                left: 20, right: 20, top: 0),
            height: 1,
            color: Color(0xFFEBE9E9),
          ),
          Container(
            margin: EdgeInsets.only(top: 80, left: 12, right: 12, bottom: 0),
            height: 50,
            width: ScreenUtil.screenWidth - 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyColors.themeColor,
            ),
            child: FlatButton(
              child: Text('登录', style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: (){

              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text('忘记密码', style: TextStyle(fontSize: 14, color: MyColors.themeColor)),
                  onPressed: (){

                  },
                ),
                FlatButton(
                  child: Text('没有账号？在此注册', style: TextStyle(fontSize: 14, color: MyColors.themeColor)),
                  onPressed: (){

                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void timeCount() {
    _CountDownTimer?.cancel();//如果已存在先取消置空
    _CountDownTimer = null;
    _CountDownTimer = new Timer.periodic(new Duration(seconds: 1), (t){
      setState(() {
        if(60-t.tick>0){//60-t.tick代表剩余秒数，如果大于0，设置yzmText为剩余秒数，否则重置yzmText，关闭countTimer
          _CountText = "${60-t.tick}秒";
        }else{
          _CountText = '获取验证码';
          _CountDownTimer.cancel();
          _CountDownTimer = null;
        }
      });
    });
  }
}