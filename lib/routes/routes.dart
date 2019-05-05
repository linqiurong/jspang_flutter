import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/routes/goods_detail_handle.dart';

class Routes {
  // 详情
  static String _goodsDetail = "/detail/:id";
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return Container(
        child: Text("Route Not Found"),
      );
    });
    router.define(_goodsDetail, handler: goodsDetailHandler);
  }
}
