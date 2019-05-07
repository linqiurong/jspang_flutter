import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cart_provide.dart';
import 'package:jspang_flutter_shop/services/cart_services.dart';

class CartItemBotton extends StatelessWidget {
  final CartServices _cartServices = new CartServices();
  @override
  Widget build(BuildContext context) {
    return Provide<CartProvide>(builder: (context, child, val) {
      double totalPrice =
          _cartServices.cartProvide(context).getTotalGoodsPrice();
      int totalNumber =
          _cartServices.cartProvide(context).getTotalGoodsNumber();
      return Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            _goodsNumber(totalNumber),
            _goodsPrice(totalPrice)
          ],
        ),
      );
    });
  }

  // 商品数量
  Widget _goodsNumber(int number) {
    return Container(
      width: ScreenUtil().setWidth(300.0),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 8.0, 0, 15.0),
      child: Text("共${number.toString()}件商品"),
    );
  }

  Widget _goodsPrice(double price) {
    return Container(
      width: ScreenUtil().setWidth(400.0),
      alignment: Alignment.centerRight,
      child: Text(
        "小计: ￥ ${price.toString()}",
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.right,
      ),
    );
  }
}
