import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/services/goods_detail_services.dart';
import 'package:jspang_flutter_shop/provide/goods_detail_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailTabBar extends StatelessWidget {
  final String _goodsDetailHtml;
  DetailTabBar(this._goodsDetailHtml);
  final GoodsDetailService _services = new GoodsDetailService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Provide<GoodsDetailProvide>(
        builder: (context, child, val) {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[_tabBar(context), _tabWidgetContent(context)],
            ),
          );
        },
      ),
    );
  }

  Widget _tabBar(BuildContext context) {
    return TabBar(
      tabs: <Widget>[_tabWidget('详情'), _tabWidget('评价')],
      onTap: (int index) {
        this._services.goodsDetailProvide(context).setTabIndex(index);
      },
    );
  }

  Widget _tabWidget(String title) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(370),
      child: Tab(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: ScreenUtil().setSp(30.0)),
        ),
      ),
    );
  }

  Widget _tabWidgetContent(BuildContext context) {
    int tabIndex = this._services.goodsDetailProvide(context).getTabIndex();

    Widget tmpWidget = tabIndex == 0
        ? _goodsDetail(this._goodsDetailHtml)
        : _goodsDetail(this._goodsDetailHtml); //_goodsComments();

    return tmpWidget;
  }

  Widget _goodsDetail(String detail) {
    return Container(
      child: Html(
        data: detail,
      ),
    );
  }
}
