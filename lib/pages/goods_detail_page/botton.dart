import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/goods_detail_model.dart';

class Botton extends StatelessWidget {
  Botton();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750.0),
      height: ScreenUtil().setHeight(90.0),
      child: Row(
        children: <Widget>[
          _cart(),
          _buttom('加入购物车', false),
          _buttom('立即购买', true)
        ],
      ),
    );
  }

  Widget _cart() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(140.0),
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            _shopCartIcon(),
            Positioned(
              top: 5.0,
              right: 10.0,
              child: _goodsNum(),
            )
          ],
        ),
      ),
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

  Widget _goodsNum() {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 3, 3, 6),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
              width: ScreenUtil().setWidth(1.0), color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Text(
        '10',
        style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(22)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttom(String bottomName, bool isBuy) {
    return Expanded(
      child: InkWell(
        onTap: () {},
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
