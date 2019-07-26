import 'package:flutter/material.dart';
import 'package:app_model/common/my_constants.dart';

class AccountSettingPage extends StatefulWidget {
  @override
  AccountSettingPageState createState() => new AccountSettingPageState();
}

class AccountSettingPageState extends State<AccountSettingPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBgColor,
      appBar: AppBar(
        backgroundColor: MyColors.themeColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('账户设置', style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
      body: ListView.separated(
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) =>Divider(color: Colors.grey,height: 1,),
          itemBuilder: (BuildContext context, int index) {
            if(index == 0) {
              return _buildListViewWidget('修改密码', null);
            } else {
              return _buildListViewWidget('修改电话', '1234567890');
            }
          }
      ),
    );
  }

  Widget _buildListViewWidget(String title, String num) {
    return Container(
        color: Colors.white,
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
                Text(title, style: TextStyle(fontSize: 15, color: Color(0xFF4A4A4A))),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      (num == null) ? Column() : Text(num, style: TextStyle(fontSize: 16, color: Color(0xFF9B9B9B))),
                      SizedBox(
                        width: 10,
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
          ],
        )
    );
  }
}