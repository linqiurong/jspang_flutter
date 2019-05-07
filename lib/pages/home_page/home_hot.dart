import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_hot_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/routes/application.dart';
import 'package:fluro/fluro.dart';

class HomeHot extends StatelessWidget {
  List<GoodsHotModel> _goodsHotList = [];
  HomeHot(this._goodsHotList);

  CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this._goodsHotList != null && this._goodsHotList.length > 0) {
      return Container(
          color: Colors.white,
          child: Wrap(
            spacing: 2,
            children: _buldGoodsList(context),
          ));
    } else {
      return commonWidgets.requestingData();
    }
  }

  // 热销商品
  List<Widget> _buldGoodsList(BuildContext context) {
    List<Widget> tmpWidget = [];
    this._goodsHotList.forEach((item) {
      tmpWidget.add(_goodsItem(context, item));
    });
    return tmpWidget;
  }

  Widget _goodsName(GoodsHotModel item) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0, top: 5.0),
      child: Text(
        item.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  // 商品价格项
  Widget _goodsPriceItem(GoodsHotModel item, bool needLineThrough) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0),
      // width: ScreenUtil().setWidth(372.0),
      child: Text(
        needLineThrough ? "￥${item.mallPrice}" : "￥${item.price}",
        style: TextStyle(
            color: needLineThrough ? Colors.black12 : Colors.black,
            decoration: needLineThrough
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(GoodsHotModel item) {
    return Row(
      children: <Widget>[
        _goodsPriceItem(item, false),
        _goodsPriceItem(item, true)
      ],
    );
  }

  // 单个热销商品
  Widget _goodsItem(BuildContext context, GoodsHotModel item) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, "/detail/${item.goodsId}",
            transition: TransitionType.fadeIn);
      },
      child: Container(
        width: ScreenUtil().setWidth(372.0),
        margin: EdgeInsets.only(bottom: 3.0),
        child: Column(
          children: <Widget>[
            Image.network(item.image),
            _goodsName(item),
            _goodsPrice(item)
          ],
        ),
      ),
    );
  }
}
