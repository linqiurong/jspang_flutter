import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cart_provide.dart';

class CartServices {
  // 获取 home provide
  CartProvide cartProvide(BuildContext context) {
    CartProvide cartProvide = Provide.value<CartProvide>(context);
    return cartProvide;
  }
}
