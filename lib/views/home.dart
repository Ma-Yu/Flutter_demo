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
    {'text': '首页', 'icon': 'images/menu_home_uncheck.png', 'selectedIcon': 'images/menu_home_selected.png'},
    {'text': '充值', 'icon': 'images/menu_my_uncheck.png', 'selectedIcon': 'images/menu_my_selected.png'},
    {'text': '我的', 'icon': 'images/menu_topup_uncheck.png', 'selectedIcon': 'images/menu_topup_selected.png'},
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: Image.asset(tabData[i]['icon'], height: 24, width: 24),
        activeIcon: Image.asset(tabData[i]['selectedIcon'], height: 24, width: 24),
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
