import 'package:flutter/material.dart';
import 'package:app_model/views/home_home.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:app_model/views/home_me.dart';

const int ThemeColor = 0xFF597EF7;

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {

  String appBarTitle = tabData[0]['text'];
  List<Widget> _list = List();
  int _currentIndex = 0;
  static List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': '充值', 'icon': Icon(Icons.payment)},
    {'text': '我的', 'icon': Icon(Icons.assignment_ind)},
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    _list
      ..add(FirstPage())
      ..add(FirstPage())
      ..add(MyPage());
  }

  @override
  void dispose() {
    super.dispose();
  }

//  renderAppBar(BuildContext context, Widget widget, int index) {
//
//    return AppBar(
//      title: new Text(appBarTitle),
//      actions: <Widget>[
//        new IconButton(icon: new Icon(Icons.list), onPressed: null),
//        new RaisedButton(
//          onPressed: (){
//            print('登录');
//          },
//          child: Text('登录', style: TextStyle(fontSize: 10),),
//        )
//      ],
//      centerTitle: true,);
//  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360)..init(context);

    return new Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Color(ThemeColor),
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}
