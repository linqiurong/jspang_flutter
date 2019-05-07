import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.black12,
      child: ListView(
        children: <Widget>[
          _avatar(),
          _orderMenu(),
          _orderState(),
          _tickets(),
          _others()
        ],
      ),
    );
  }

  // 头像
  Widget _avatar() {
    List<Color> bgColors = [Colors.pinkAccent, Colors.pink[100]];
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: bgColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
                child: Image.network(
                    'http://blogimages.jspang.com/blogtouxiang1.jpg')),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              '技术胖',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderMenu() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: _listTitleItem(Icons.autorenew, "我的订单", true),
    );
  }

  Widget _listTitleItem(IconData icon, String title, bool isLast) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: isLast == false
                  ? BorderSide(width: 1, color: Colors.black12)
                  : BorderSide.none)),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderState() {
    return Container(
      child: Row(
        children: <Widget>[
          _orderStateItem(Icons.assignment_ind, "待付款"),
          _orderStateItem(Icons.assignment_returned, "待发货"),
          _orderStateItem(Icons.assignment_late, "待收货"),
          _orderStateItem(Icons.assignment_turned_in, "待评价"),
        ],
      ),
    );
  }

  Widget _orderStateItem(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 8),
      alignment: Alignment.center,
      color: Colors.white,
      width: ScreenUtil().setWidth(187),
      child: Column(
        children: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: Icon(icon),
            tooltip: title,
          ),
          Text(title)
        ],
      ),
    );
  }

  Widget _tickets() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          _listTitleItem(Icons.headset, "领取优惠卷", false),
          _listTitleItem(Icons.timelapse, "已领取优惠卷", false),
          _listTitleItem(Icons.location_city, "地址管理", true)
        ],
      ),
    );
  }

  Widget _others() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          _listTitleItem(Icons.mobile_screen_share, "客服电话", false),
          _listTitleItem(Icons.info, "关于商城", true),
        ],
      ),
    );
  }
}
