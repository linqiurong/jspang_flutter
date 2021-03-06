import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/cart_model.dart';
import 'package:jspang_flutter_shop/model/goods_detail_model.dart';
import 'package:jspang_flutter_shop/services/cart_services.dart';
import 'package:jspang_flutter_shop/services/home_services.dart';
import 'package:toast/toast.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cart_provide.dart';

class Botton extends StatelessWidget {
  final GoodInfo _goodsInfo;

  Botton(this._goodsInfo);

  final CartServices _cartServices = new CartServices();
  final HomeService _homeService = new HomeService();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750.0),
      height: ScreenUtil().setHeight(80.0),
      child: Row(
        children: <Widget>[
          _cart(context),
          _buttom(context, '加入购物车', false),
          _buttom(context, '立即购买', true)
        ],
      ),
    );
  }

  Widget _cart(BuildContext context) {
    return Provide<CartProvide>(
      builder: (context, child, val) {
        int totalNumber =
            _cartServices.cartProvide(context).getCartGoodsNumber();
        return InkWell(
          onTap: () {
            _homeService.homeProvide(context).setBottonIndex(2);
            Navigator.pop(context);
          },
          child: Container(
            width: ScreenUtil().setWidth(110.0),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                _shopCartIcon(),
                Positioned(
                  top: 0,
                  right: 0,
                  child: _goodsNum(context, totalNumber),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _shopCartIcon() {
    return Container(
      child: Icon(
        Icons.shopping_cart,
        color: Colors.pink,
        size: 35,
      ),
    );
  }

  Widget _goodsNum(BuildContext context, int totalNumber) {
    if (totalNumber > 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(
                width: ScreenUtil().setWidth(1.0), color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Text(
          "${totalNumber.toString()}",
          style:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(22)),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Text('');
    }
  }

  Widget _buttom(BuildContext context, String bottomName, bool isBuy) {
    return Expanded(
      child: InkWell(
        onTap: isBuy
            ? () {
                // 清除
                this._cartServices.cartProvide(context).clear().then((val) {
                  Toast.show("清除成功", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                });
              }
            : () {
                // 获取商品数据
                CartGoodsModel tmpCartGoods = new CartGoodsModel();
                tmpCartGoods.goodsName = this._goodsInfo.goodsName;
                tmpCartGoods.goodsImage = this._goodsInfo.image1;
                tmpCartGoods.presentPrice = this._goodsInfo.presentPrice;
                tmpCartGoods.orignPrice = this._goodsInfo.oriPrice;
                tmpCartGoods.isChecked = false;
                tmpCartGoods.goodsNumber = 1;
                tmpCartGoods.goodsID = this._goodsInfo.goodsId;

                this
                    ._cartServices
                    .cartProvide(context)
                    .setCartGoodsList(tmpCartGoods, context)
                    .then((val) {
                  Toast.show("加入成功", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                });
              },
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: isBuy ? Colors.red : Colors.green,
          alignment: Alignment.center,
          child: Text(bottomName,
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(36.0))),
        ),
      ),
    );
  }
}
