import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/services/cart_services.dart';

class CartBotton extends StatelessWidget {
  final CartServices _services = new CartServices();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750.0),
        height: ScreenUtil().setHeight(100),
        child: Row(
          children: <Widget>[
            _checkAll(context),
            _totalPrice(context),
            _checkout(context),
          ],
        ),
      ),
    );
  }

  // 全选
  Widget _checkAll(BuildContext context) {
    bool isCheckAll = _services.cartProvide(context).getCheckAll();
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            onChanged: (bool checked) {
              _services.cartProvide(context).change("", false, false, true);
            },
            value: isCheckAll,
          ),
          Text("全选")
        ],
      ),
    );
  }

  // 总价格
  Widget _totalPrice(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[_totalStr(), _price(context)],
          ),
          Text("满10元免配送费,预购免配送费")
        ],
      ),
    );
  }

  Widget _totalStr() {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        "合计:",
        style: TextStyle(fontSize: ScreenUtil().setSp(34.0)),
      ),
    );
  }

  Widget _price(BuildContext context) {
    // 获取数量
    double totalPrice = _services.cartProvide(context).getTotalGoodsPrice();
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "￥${totalPrice.toString()}",
        style: TextStyle(fontSize: ScreenUtil().setSp(32.0), color: Colors.red),
      ),
    );
  }

  Widget _checkout(BuildContext context) {
    // 获取数量
    int totalNumber = _services.cartProvide(context).getTotalGoodsNumber();
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5.0),
      //width: ScreenUtil().setWidth(40.0),
      child: Text("结算(${totalNumber.toString()})",
          style: TextStyle(color: Colors.white)),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }
}
