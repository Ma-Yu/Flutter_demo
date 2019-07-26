import 'package:flutter/material.dart';
import 'package:app_model/widget/home/home_topSwiper.dart';
import 'package:app_model/model/home/home_button_items.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:app_model/widget/home/home_btnListWidget.dart';
import 'package:app_model/widget/home/animation_headlines.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:app_model/common/myAppBar.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}


class FirstPageState extends State<FirstPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  List<HomeBtnItem> HomeBtnItems;
  Size _sizeRed;

  TabController _controller;
  int _currentIndex = 0;

  ScrollController _scrollViewController;
  GlobalKey _keyFilter = GlobalKey();

  void initData() async {
//    List querys = await getHotSugs();
    setState(() {
//      _hotWords = querys;
    });
  }

  _afterLayout(_) {
    _getPositions('_keyFilter', _keyFilter);
    _getSizes('_keyFilter', _keyFilter);
  }

  _getPositions(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    var positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of $log: $positionRed ");
  }

  _getSizes(log, GlobalKey globalKey) {
    RenderBox renderBoxRed = globalKey.currentContext.findRenderObject();
    _sizeRed = renderBoxRed.size;
    setState(() {});
    print("SIZE of $log: $_sizeRed");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    HomeBtnItems = HomeBtnList.fromJson(menueDataJson['items']).items;

    initData();
    _controller = TabController(vsync: this, length: 3);
    _controller.addListener(_handleTabSelection);

    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _controller.dispose();
  }

  Widget _tabBarSel() {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color.fromRGBO(214, 214, 214, 1.0), width: 1))
      ),
      child: TabBar(
          controller: _controller,
          indicatorColor: MyColors.themeColor,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: MyColors.themeColor,
          labelPadding: EdgeInsets.all(0),
          unselectedLabelColor: Colors.black,
          tabs:[
            _tabBarItem('热门'),
            _tabBarItem('资讯'),
            _tabBarItem('电子', showRightImage: false),
          ]
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
//    super.build(context);

    var views = Column(
      children: <Widget>[
        SwiperPage(),
        _buildSwiperButtonWidget(),
        _buildAnimationLineWidget(),
      ],
    );

    double statusBarHeight = MediaQuery.of(context).padding.top;
    double _swiperHeight = 200 + 10.0;
    double _btnListHeight = 120;
    double _hotLineHeight = 60;
    double _statusH;
    if (statusBarHeight == 20) {
      _statusH = statusBarHeight;
    } else {
      _statusH = statusBarHeight-20;
    }
    double _appBarHeight =
        _swiperHeight + _btnListHeight + _hotLineHeight - kToolbarHeight - _statusH;

    var body = NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: SliverAppBar(
              forceElevated: boxIsScrolled,
              backgroundColor: MyColors.mainBgColor,
//              expandedHeight: (_sizeRed == null ? 360 : _sizeRed.height) + 50.0,
              bottom: PreferredSize(
                child: Container(),
                preferredSize: Size.fromHeight(_appBarHeight)
              ),
              flexibleSpace: Column(
                children: <Widget>[views],
              ),
            )
          ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(_tabBarSel()),
              pinned: true,
            ),
        ];
      },
      body: TabBarView(controller: _controller, children: [
        _buildListView("aaa:"),
        _buildListView("bbb:"),
        _buildListView("ccc:"),
      ])
    );

    return Scaffold(
        backgroundColor: MyColors.mainBgColor,
        appBar: PreferredSize(
            child: AppBar(
              brightness: Brightness.dark,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(0)
        ),
//        AppBar(
//          title: new Text('标题'),
//          actions: <Widget>[
//            new IconButton(icon: ImageIcon(AssetImage('images/ic_home_login.png'),size: 40,color: Colors.white,), onPressed: null, color: Colors.transparent,),
//            new RaisedButton(
//              onPressed: (){
//                print('登录');
//              },
//              child: Text('登录', style: TextStyle(fontSize: 10),),
//            )
//          ],
//          centerTitle: true,
//        ),
        body: Column(
          children: <Widget>[
            MyAppBar(),
            Expanded(child: body),
          ],
        )
    );
  }

  Widget _buildSwiperButtonWidget() {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
//      height: 175,
      height: ScreenUtil().L(80) + 15,
      child: Swiper(
        /// 初始的时候下标位置
        index: 0,

        /// 无限轮播模式开关
        loop: false,

        ///
        itemBuilder: (context, index) {
          List data = [];
          for (var i = index * 5; i < index * 5 + 5; ++i) {
            //0-4,5-9,10-14,15-19
            if (i >= HomeBtnItems.length) {
              break;
            }
            data.add(HomeBtnItems[i]);
          }

          return Column(
            children: <Widget>[
              HomeBtnWidget(
                data: data,
                fontColor: (menueDataJson['config'] as dynamic)['color'],
                bgurl: (menueDataJson['config'] as dynamic)['pic_url'],
              ),
            ],
          );
        },

        ///
        itemCount: (HomeBtnItems.length / 5).toInt() + (HomeBtnItems.length % 5 > 0 ? 1 : 0),
        /// 当用户点击某个轮播的时候调用
        onTap: (index) {
          print('点击了第$index个');
        },

        /// 滚动方向，设置为Axis.vertical如果需要垂直滚动
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildAnimationLineWidget() {
    return Container(
      height: 42,
      margin: const EdgeInsets.all(5),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white,
      ),
      child: AnimationHeadlinesWidget(),
    );
  }

  _handleTabSelection() {
    print('_handleTabSelection:${_controller.index}');
    setState(() {
      _currentIndex = _controller.index;
    });
  }

  Widget _buildListView(String s){
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) =>Divider(color: Colors.grey,height: 1,),
        itemBuilder: (BuildContext context, int index) {
          return Container(color: Colors.white, child: ListTile(title: Text("$s第$index 个条目")));
        });
  }

  Widget _tabBarItem(String title, {bool showRightImage = true}) {
    return Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              ),
            ),

            ///分割符自定义，可以放任何widget
            showRightImage
                ? Text('|', style: TextStyle(color: Color(0xffd0d0d0), fontSize: 23, fontWeight: FontWeight.normal))
                : Text(' ', style: TextStyle(color: Color(0xffd0d0d0), fontSize: 23))
          ],
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Container _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}