import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:jspang_flutter_shop/pages/goods_detail.dart';

// 定义
var goodsDetailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String goodsId = params["id"]?.first;
  return GoodsDetail(goodsId);
});
