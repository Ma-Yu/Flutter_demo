import 'package:flutter/material.dart';
import 'package:app_model/views/home_topSwiper.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:app_model/model/home/home_button_items.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:app_model/widget/home/home_btnListWidget.dart';
import 'package:app_model/widget/home/animation_headlines.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}


class FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  List<HomeBtnItem> HomeBtnItems;

  @override
  void initState() {
    super.initState();
    HomeBtnItems = HomeBtnList.fromJson(menueDataJson['items']).items;
    print('duandian');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var views = Column(
      children: <Widget>[
        SwiperPage(),
        _buildSwiperButtonWidget(),
        _buildAnimationLineWidget(),
      ],
    );

    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 247, 251, 1.0),
        appBar: AppBar(
          title: new Text('标题'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: null),
            new RaisedButton(
              onPressed: (){
                print('登录');
              },
              child: Text('登录', style: TextStyle(fontSize: 10),),
            )
          ],
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Offstage(
              offstage: false,
              child: Container(
                child: views,
//                key: _keyFilter,
              ),
            ),
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

        /// 设置 new SwiperPagination() 展示默认分页指示器
//        pagination: new SwiperPagination(
//            alignment: Alignment.bottomCenter,
//            builder: RectSwiperPaginationBuilder(
//                color: Color(0xFFd3d7de),
//                activeColor: Theme.of(context).primaryColor,
//                size: Size(18, 3),
//                activeSize: Size(18, 3),
//                space: 0)
//        ),

        /// 设置 new SwiperControl() 展示默认分页按钮
        // control: SwiperControl(),

        /// 自动播放开关.
//        autoplay: false,

        /// 动画时间，单位是毫秒
//        duration: 300,

        /// 当用户点击某个轮播的时候调用
        onTap: (index) {
          print('点击了第$index个');
        },

        /// 滚动方向，设置为Axis.vertical如果需要垂直滚动
        scrollDirection: Axis.horizontal,
      ),
    );
  }
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