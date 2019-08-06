import 'package:flutter/material.dart';
import 'package:app_model/common/screen_util.dart';
import 'package:app_model/common/my_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeHotPage extends StatefulWidget {
  final String type;

  HomeHotPage({Key key, this.type}) : super(key : key);
  @override
  HomeHotPageState createState() {
    return HomeHotPageState();
  }
}

class HomeHotPageState extends State<HomeHotPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Widget _headerView(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Stack(
              children: <Widget>[
                Image.network('https://aecpm.alicdn.com/simba/img/TB14ab1KpXXXXclXFXXSutbFXXX.jpg_q50.jpg',
                    height: ScreenUtil.screenWidth / 2,
                    width: ScreenUtil.screenWidth-20,
                    fit: BoxFit.fill,
                ),
                Positioned(//方法二
                  top: 0.0,
                  right: 0.0,
                  child: Image.asset(
                    'images/home/picture_home_Hotrecommended.png',
                    width: 60,
                    height: 20,
                    fit: BoxFit.fill,
                  ),
                ),
              ]),
          SizedBox(height: 10),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: <Widget>[
        Expanded(child: _listContent())
      ],
    );
  }

  Widget _listContent() {
    return ListView.builder(
      itemCount: widget.type == 'video' ? 2 :10,
      itemBuilder: (context, index){
        if(index == 0) {
          return _headerView();
        } else {
        return widget.type == 'video' ? _gridContent() : _listItem(index);
        }

      },
    );
  }

  Widget _listItem(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                    image: Image.asset(
                      'images/home/ic_home_new.png',
                      fit: BoxFit.fill,
                    ).image)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: ScreenUtil.screenWidth - 155,
            child: Column(
//              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                Text(
                  '游戏title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  '游戏介绍游戏介绍游戏介绍游戏介绍游戏介绍游戏介绍游戏介绍游戏介绍',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFF9B9B9B)),
                  softWrap: false
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 0),
            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 26,
                  child: FlatButton(
                    color: MyColors.themeColor,
                    child: Text('开始', style: TextStyle(fontSize: 14, color: Colors.white)),
                    onPressed: (){

                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _gridContent() {
    return Container(
      height: ScreenUtil.screenWidth,
      child: GridView.count(
        padding: const EdgeInsets.all(8.0),
        primary: false,
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        children: <Widget>[
          gridItem(),
          gridItem(),
          gridItem(),
          gridItem()
        ],
      ),
    );
  }

  Widget gridItem() {
    double imageH = (ScreenUtil.screenWidth / 2) - (8 * 3);
    return Container(
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.fill,
            height: imageH - 20,
            width: imageH,
            imageUrl: "https://aecpm.alicdn.com/simba/img/TB14ab1KpXXXXclXFXXSutbFXXX.jpg_q50.jpg",
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          SizedBox(
            height: 6,
          ),
          Text('文案文案文案', style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 14)),
        ],
      ),
    );
  }
}