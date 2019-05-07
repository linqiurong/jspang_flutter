import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/pages/cart_page/cart_item.dart';
import 'package:jspang_flutter_shop/pages/cart_page/cart_item_botton.dart';
import 'package:jspang_flutter_shop/pages/cart_page/cart_botton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cart_provide.dart';
import 'package:jspang_flutter_shop/services/cart_services.dart';
import 'dart:convert';
import 'package:jspang_flutter_shop/model/cart_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class CartPage extends StatelessWidget {
  CartServices _cartServices = new CartServices();
  CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    // 调用
    this._getCartGoodsList(context);
    // 获取数据
    return Provide<CartProvide>(
      builder: (context, child, val) {
        return Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 50.0),
              width: ScreenUtil().setWidth(750),
              child: ListView(
                children: _buildCartList(context),
              ),
            ),
            CartBotton()
          ],
        );
      },
    );
  }

  // List<Widget> _buildCartList3(
  //     BuildContext context, List<CartGoodsModel> tmpCartGoodsList) {
  //   List<Widget> tmpWidgetList = [];

  //   if (tmpCartGoodsList != null) {
  //     tmpCartGoodsList.forEach((item) {
  //       tmpWidgetList.add(CartItem(item));
  //     });
  //   } else {
  //     tmpWidgetList.add(this._commonWidgets.requestedNone());
  //   }
  //   tmpWidgetList.add(CartItemBotton());
  //   return tmpWidgetList;
  // }

  List<Widget> _buildCartList(BuildContext context) {
    List<Widget> tmpWidgetList = [];

    List<CartGoodsModel> tmpCartGoodsList =
        _cartServices.cartProvide(context).getCartGoodsAllList();

    if (tmpCartGoodsList != null && tmpCartGoodsList.length > 0) {
      tmpCartGoodsList.forEach((item) {
        tmpWidgetList.add(CartItem(item));
      });
    } else {
      tmpWidgetList.add(this._commonWidgets.requestedNone());
    }
    // 如果数据项存在则添加CartItemBotton
    tmpCartGoodsList != null && tmpCartGoodsList.length > 0
        ? tmpWidgetList.add(CartItemBotton())
        : "";
    return tmpWidgetList;
  }

  // List<Widget> _buildCartList2(BuildContext context) {
  //   List<Widget> tmpWidgetList = [];
  //   // 获取缓存数据
  //   _cartServices.cartProvide(context).getCartGoodsList().then((result) {
  //     if (result != "") {
  //       List tmpCartGoodsList = (jsonDecode(result) as List);

  //       tmpCartGoodsList.forEach((item) {
  //         tmpWidgetList.add(CartItem(CartGoodsModel.fromJson(item)));
  //       });
  //     } else {
  //       tmpWidgetList.add(this._commonWidgets.requestedNone());
  //     }
  //     tmpWidgetList.add(CartItemBotton());
  //   });

  //   return tmpWidgetList;
  // }

  // 获取数据
  List<CartGoodsModel> _getCartGoodsList(BuildContext context) {
    List<CartGoodsModel> cartGoodsList = [];
    _cartServices.cartProvide(context).getCartGoodsList().then((result) {
      //print("Result:" + result.toString());
      if (result != null) {
        List tmpCartGoodsList = (jsonDecode(result) as List);
        if (tmpCartGoodsList != null && tmpCartGoodsList.length > 0) {
          tmpCartGoodsList.forEach((item) {
            cartGoodsList.add(CartGoodsModel.fromJson(item));
          });
        }
      }
    });
    return cartGoodsList;
  }
}
