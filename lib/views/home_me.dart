import 'package:flutter/material.dart';
import 'package:app_model/widget/pull_load/ListState.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:app_model/widget/me/me_top.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:app_model/views/me_accountSetting.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage>
    with AutomaticKeepAliveClientMixin<MyPage>, ListState<MyPage>, WidgetsBindingObserver {

  static const Color _backgroundColor = Color(0xFFf3f3f3);
  Gradient _mainGradient = const LinearGradient(colors: [_backgroundColor, _backgroundColor]);

  static List listData = [
    {'text': '手机验证码', 'icon': 'images/me/ic_my_Phoneverification.png'},
    {'text': '我的任务', 'icon': 'images/me/ic_my_Mytask.png'},
    {'text': '推荐好友', 'icon': 'images/me/ic_my_recommended.png'},
    {'text': '银行资料', 'icon': 'images/me/ic_bank_bankinformation.png'},
    {'text': '交易记录', 'icon': 'images/me/ic_my_Transactionrecords.png'},
    {'text': '版本更新', 'icon': 'images/me/ic_my_update.png'},
    {'text': '清除缓存', 'icon': 'images/me/ic_my_garbage.png'},
    {'text': '账户设置', 'icon': 'images/me/ic_my_account.png'},
  ];

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
      itemCount: listData.length + 3,

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
    } else if(index == 2) {
      return Container(
        color: MyColors.mainBgColor,
        width: ScreenUtil.screenWidth,
        margin: EdgeInsets.only(left: 12,top: 0, bottom: 0),
        child: Text(
            '我的资料',
            style: TextStyle(
                fontSize: 14.0,
                height: 1.5,
                decoration: TextDecoration.none,
                color: Color(0xFF5A7CFF))
        ),
      );
    } else {
      return Container(
        color: MyColors.mainBgColor,
        width: ScreenUtil.screenWidth,
        child: GestureDetector(
          onTap: () {
            switch (index) {
              case 10:
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => AccountSettingPage())
                );
                break;
            }
          },
          child: _buildListViewWidget(index, index == 5 || index == 7 || index == 10),
        )

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
                  Image.asset('images/me/ic_my_topup.png',height: 60, width: 60),
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
                  Image.asset('images/me/ic_my_topup.png',height: 60, width: 60),
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
                  Image.asset('images/me/ic_my_topup.png',height: 60, width: 60),
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

  Widget _buildListViewWidget(int index, bool needBottom) {
    final double verifyOpacity = (index == 3) ? 1 : 0;

    return Container(
      margin: const EdgeInsets.only(left: 6, right: 6),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
//      height: ScreenUtil().L(42),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 8,
              ),
              Container(
                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(listData[index - 3]['icon'],height: 22, width: 22),
                    SizedBox(
                      width: 10,
                    ),
                    Text(listData[index-3]['text'], style: TextStyle(fontSize: 14, color: Color(0xFF4A4A4A))),
                  ],
                ),
              ),

              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Opacity(
                      opacity: verifyOpacity,
                      child: Image.asset('images/me/ic_my_Novalidation.png',height: 18, width: 50),
                    ),
                    Image.asset('images/ic_wy_next.png',height: 15, width: 15),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          needBottom ? Container(
            height: 8,
            color: MyColors.mainBgColor,
          ) : Container(
            height: 1,
            color: Color(0xFFD8D8D8),
          ),
        ],
      )
    );
  }
}