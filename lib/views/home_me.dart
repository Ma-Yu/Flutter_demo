import 'package:flutter/material.dart';
import 'package:app_model/widget/pull_load/ListState.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:app_model/widget/me/me_top.dart';
import 'package:app_model/common/screen_util.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage>
    with AutomaticKeepAliveClientMixin<MyPage>, ListState<MyPage>, WidgetsBindingObserver {

  static const Color _backgroundColor = Color(0xFFf3f3f3);
  Gradient _mainGradient = const LinearGradient(colors: [_backgroundColor, _backgroundColor]);

  @override
  bool get wantKeepAlive => true;

  @override
  bool get isRefreshFirst => false;
  ScrollController _scrollViewController;
  Size _sizeRed;
  GlobalKey _keyFilter = GlobalKey();
//  double _firstItemHeight = 0;
  BuildContext _context;

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

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
//    WidgetsBinding.instance.addObserver(this);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    super.build(context);

    var body = Container(
      child: MediaQuery.removePadding(
        removeTop: true,
        child: NotificationListener<ScrollNotification>(
          onNotification: _onScroll,
          child: Scrollbar(
            child: _buildListView(),
          ),
        ),
        context: context,
      )
    );

    return SafeArea(
      child: body,
      top: false,
    );
  }

  bool _onScroll(ScrollNotification scroll) {

  }

  Widget _buildListView(){
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _getItem(index);
      },

      ///根据状态返回数量
      itemCount: 2,

      ///滑动监听
      controller: _scrollViewController,
    );
  }

  _getItem(int index) {
    if(index == 0) {
      return Container(
        color: MyColors.mainBgColor,
        child: TopItem(),
      );
    }
    if(index == 1) {
      return Container(
        color: MyColors.mainBgColor,
        child: _buildMidButtonWidget(),
      );
    }
  }

  Widget _buildMidButtonWidget() {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
//      height: 175,
      height: ScreenUtil().L(100) + 20,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 60,
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/ic_my_topup.png',height: 60, width: 60),
                  Text(
                    '快捷充值',
                    style: TextStyle(
                        fontSize: 15.0,
                        height: 1.5,
                        decoration: TextDecoration.none,
                        color: Color(0xFF5A7CFF))
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 60,
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/ic_my_topup.png',height: 60, width: 60),
                  Text(
                      '申请提现',
                      style: TextStyle(
                          fontSize: 15.0,
                          height: 1.5,
                          decoration: TextDecoration.none,
                          color: Color(0xFF5A7CFF))
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 60,
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/ic_my_topup.png',height: 60, width: 60),
                  Text(
                      '文案文案',
                      style: TextStyle(
                          fontSize: 15.0,
                          height: 1.5,
                          decoration: TextDecoration.none,
                          color: Color(0xFF5A7CFF))
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}