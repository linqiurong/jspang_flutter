import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cate_provide.dart';
import 'package:jspang_flutter_shop/services/cate_services.dart';
import 'package:jspang_flutter_shop/model/goods_list_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

class CateRightContent extends StatelessWidget {
  List<Goods> _goodsListData = [];

  CateService _cateServices = new CateService();

  CommonWidgets commonWidgets = new CommonWidgets();

  // easyRefresh
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  //
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  //
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(569.0),
      child: Provide<CateProvide>(
        builder: (context, child, val) {
          this._goodsListData =
              _cateServices.cateProvide(context).getGoodsListData();
          if (this._goodsListData != null && this._goodsListData.length > 0) {
            return EasyRefresh(
                key: _easyRefreshKey,
                refreshHeader: BallPulseHeader(
                  key: _headerKey,
                  color: Colors.white,
                  backgroundColor: Colors.pink,
                ),
                refreshFooter: BallPulseFooter(
                  key: _footerKey,
                  color: Colors.white,
                  backgroundColor: Colors.pink,
                ),
                onRefresh: () {
                  print("onRefresh");
                },
                loadMore: () {
                  print("LoadMore");
                },
                // child: ListView(
                //   children: _buldGoodsList(),
                // )

                // child: Wrap(
                //   spacing: 2,
                //   children: this._buldGoodsList(),
                // ),
                child: _wrapContent());
          } else {
            return commonWidgets.requestingData();
          }
        },
      ),
    );
  }

  _wrapContent() {
    return Wrap(
      spacing: 2,
      children: _buldGoodsList(),
    );
  }

  // 商品列表
  List<Widget> _buldGoodsList() {
    List<Widget> tmpWidgetsList = [];
    this._goodsListData.forEach((item) {
      tmpWidgetsList.add(this._goodsItem(item));
    });
    return tmpWidgetsList;
  }

  // 单个商品
  Widget _goodsItem(Goods item) {
    return Container(
      width: ScreenUtil().setWidth(280.0),
      padding: EdgeInsets.only(top: 5.0),
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Image.network(item.image, fit: BoxFit.fill),
            Text(
              "${item.goodsName}",
              style: TextStyle(
                color: Colors.pink,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: <Widget>[
                this._goodsPrice(item, false),
                this._goodsPrice(item, true)
              ],
            )
          ],
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(Goods item, bool needLineThrough) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 3.0, 0.0, 3.0),
      child: Text(
        needLineThrough == true ? "￥${item.oriPrice}" : "￥${item.presentPrice}",
        style: TextStyle(
            color: needLineThrough == true ? Colors.black12 : Colors.black,
            decoration: needLineThrough == true
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
    );
  }
}
