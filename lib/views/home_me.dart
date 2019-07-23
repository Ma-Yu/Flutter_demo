import 'package:flutter/material.dart';
import 'package:app_model/widget/pull_load/ListState.dart';
import 'package:app_model/widget/pull_load/PullLoadWidget.dart';

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

  GlobalKey _keyFilter = GlobalKey();
  double _firstItemHeight = 0;
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
    var sizeRed = renderBoxRed.size;
    print("SIZE of $log: $sizeRed");

    setState(() {
      _firstItemHeight = sizeRed.height;
    });
  }

  @override
  Widget build(BuildContext context) {

  }

}