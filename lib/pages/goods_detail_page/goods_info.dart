import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/goods_detail_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class GoodsInfo extends StatelessWidget {
  final GoodInfo _goodsInfo;
  GoodsInfo(this._goodsInfo);

  final CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this._goodsInfo != null) {
      return Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        child: Column(
          children: <Widget>[
            _goodsImage(),
            _goodsName(),
            _goodsCode(),
            _goodsPrice()
          ],
        ),
      );
    } else {
      return this._commonWidgets.requestingData();
    }
  }

  Widget _goodsImage() {
    return Container(
      child: Image.network(this._goodsInfo.image1),
    );
  }

  Widget _goodsName() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(100.0),
      child: Text(
        this._goodsInfo.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
      ),
    );
  }

  Widget _goodsCode() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
      alignment: Alignment.centerLeft,
      child: Text(
        "编号:${this._goodsInfo.goodsSerialNumber}",
        style: TextStyle(
            color: Colors.black12, fontSize: ScreenUtil().setSp(28.0)),
      ),
    );
  }

  Widget _goodsPrice() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 10.0),
      child: Row(
        children: <Widget>[_price(false), _price(true)],
      ),
    );
  }

  Widget _price(bool isOrignPrice) {
    double price =
        isOrignPrice ? this._goodsInfo.oriPrice : this._goodsInfo.presentPrice;
    // 颜色
    Color color = isOrignPrice ? Colors.black12 : Colors.red;
    TextDecoration decoration =
        isOrignPrice ? TextDecoration.lineThrough : TextDecoration.none;
    double fontSize =
        isOrignPrice ? ScreenUtil().setSp(30) : ScreenUtil().setSp(36);
    return Container(
      width: ScreenUtil().setWidth(350.0),
      child: Text(
        "￥ ${price.toString()}",
        style:
            TextStyle(color: color, decoration: decoration, fontSize: fontSize),
      ),
    );
  }
}
