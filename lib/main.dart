import 'package:flutter/material.dart';
// 主页
import 'package:jspang_flutter_shop/pages/home_page.dart';
// Provide
import 'package:provide/provide.dart';
import 'provide/home_provide.dart';
import 'provide/cate_provide.dart';
import 'provide/goods_detail_provide.dart';
// 路由
import 'package:fluro/fluro.dart';
import 'package:jspang_flutter_shop/routes/routes.dart';
import 'package:jspang_flutter_shop/routes/application.dart';

void main() {
  // 注册providers
  HomeProvide homeProvide = HomeProvide();
  CateProvide cateProvide = new CateProvide();
  GoodsDetailProvide goodsDetailProvide = new GoodsDetailProvide();
  var provides = new Providers()
    ..provide(Provider<HomeProvide>.value(homeProvide)) // 首页数据provider
    ..provide(Provider<CateProvide>.value(cateProvide)) // 分类
    ..provide(Provider<GoodsDetailProvide>.value(goodsDetailProvide)); // 商品详情

  runApp(ProviderNode(
    providers: provides,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Router router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}
