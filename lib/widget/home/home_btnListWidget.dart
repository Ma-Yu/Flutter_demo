import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app_model/model/home/home_button_items.dart';
import 'package:app_model/common/screen_util.dart';

class HomeBtnWidget extends StatelessWidget {
  final List data;
  final String bgurl;
  final String fontColor;
  HomeBtnWidget({this.data, this.bgurl, this.fontColor});
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    double height = ScreenUtil().L(87);
    return Container(
      width: deviceWidth,
      height: height,
      child: _buildRow(deviceWidth),
      decoration: bgurl != ''
          ? BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(bgurl), fit: BoxFit.cover))
          : null,
    );
  }

  Row _buildRow(double deviceWidth) {
    var colorInt = int.parse(fontColor.replaceAll('#', '0x'));
    Color color = new Color(colorInt).withOpacity(1.0);
    double iconWidth = ScreenUtil().L(60);
    double iconHeight = ScreenUtil().L(60);
    List<Widget> widgets = data.map((i) {
      return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//          Image.network(
//            i.picUrl,
//            width: iconWidth,
//            height: iconHeight,
//          ),
              CachedNetworkImage(
                width: iconWidth,
                height: iconHeight,
                imageUrl: i.picUrl,
//            placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
              Text(
                i.title,
                style: TextStyle(
                    fontSize: 13.0,
                    height: 1.5,
                    decoration: TextDecoration.none,
                    color: color),
              )
            ],
          ));
    }).toList();
    return Row(
      children: widgets,
    );
  }
}
