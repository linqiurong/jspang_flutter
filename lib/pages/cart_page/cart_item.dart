import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/cart_model.dart';
import 'package:jspang_flutter_shop/services/cart_services.dart';

class CartItem extends StatelessWidget {
  CartGoodsModel _cartGoods;
  CartItem(this._cartGoods);

  CartServices _cartServices = new CartServices();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.black12))),
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(200.0),
        child: Row(
          children: <Widget>[
            _itemCheckBox(context),
            _itemGoodsImg(),
            _itemGoodsAndChange(context),
            _itemGoodsPrice(context)
          ],
        ));
  }

  // 选择项
  Widget _itemCheckBox(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      child: Checkbox(
        onChanged: (bool checked) {
          // changeChecked
          _cartServices
              .cartProvide(context)
              .change(this._cartGoods.goodsID, true);
          //print("Checked:" + checked.toString());
        },
        activeColor: Colors.red,
        value: this._cartGoods.isChecked,
      ),
    );
  }

  // 商品图片
  Widget _itemGoodsImg() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(5.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.black12)),
      width: ScreenUtil().setWidth(140.0),
      child: Image.network(this._cartGoods.goodsImage, fit: BoxFit.fill),
    );
  }

  // 商品名称
  Widget _itemGoodsName() {
    return Container(
      margin: EdgeInsets.only(left: 3.0),
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(80),
      child: Text(
        this._cartGoods.goodsName,
        style: TextStyle(fontSize: ScreenUtil().setSp(24.0)),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // 商品数量
  Widget _itemGoodsNumberChange(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.0, top: 3.0),
      child: Row(
        children: <Widget>[
          _reduceAndPlus(context, isReduce: true),
          _itemGoodsNumber(),
          _reduceAndPlus(context, isReduce: false),
        ],
      ),
    );
  }

  // 相加相减
  Widget _reduceAndPlus(BuildContext context, {@required bool isReduce}) {
    Color bgColor = isReduce == true && this._cartGoods.goodsNumber > 1
        ? Colors.white
        : Colors.black26;
    bgColor = isReduce == false ? Colors.white : bgColor;

    String reduceStr = isReduce
        ? isReduce == true && this._cartGoods.goodsNumber > 1 ? '-' : " "
        : '+';
    return InkWell(
      onTap: () {
        _cartServices
            .cartProvide(context)
            .change(this._cartGoods.goodsID, false, isReduce);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black12),
            color: bgColor),
        padding: EdgeInsets.all(8.0),
        child: Text(
          "${reduceStr}",
          style: TextStyle(
              color: Colors.black12, fontSize: ScreenUtil().setSp(24.0)),
        ),
      ),
    );
  }

  Widget _itemGoodsNumber() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1, color: Colors.black12),
              bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Text("${this._cartGoods.goodsNumber.toString()}"),
    );
  }

  // 商品名称与商品数量
  Widget _itemGoodsAndChange(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Column(
          children: <Widget>[_itemGoodsName(), _itemGoodsNumberChange(context)],
        ),
      ),
    );
  }

  // 商品价格
  Widget _itemGoodsPrice(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[_presentPrice(), _orignPrice(), _delete(context)],
      ),
    );
  }

  // 现价
  Widget _presentPrice() {
    return Container(
      child: Text("￥ ${this._cartGoods.presentPrice}",
          style: TextStyle(fontSize: ScreenUtil().setSp(28.0))),
    );
  }

  // 原价
  Widget _orignPrice() {
    return Container(
      child: Text("￥ ${this._cartGoods.orignPrice}",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(24.0),
              decoration: TextDecoration.lineThrough,
              color: Colors.black12)),
    );
  }

  // 删除
  Widget _delete(BuildContext context) {
    return InkWell(
      onTap: () {
        _cartServices
            .cartProvide(context)
            .change(this._cartGoods.goodsID, false, false, false, true);
      },
      child: Container(
        child: Icon(
          Icons.delete,
          size: 35,
          color: Colors.black26,
        ),
      ),
    );
  }
}
