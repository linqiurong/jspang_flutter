import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/pages/home_page.dart';
import 'package:provide/provide.dart';
import 'provide/home_provide.dart';
import 'provide/cate_provide.dart';

void main() {
  // 注册providers
  HomeProvide homeProvide = HomeProvide();
  CateProvide cateProvide = new CateProvide();
  var provides = new Providers()
    ..provide(Provider<HomeProvide>.value(homeProvide)) // 首页数据provider
    ..provide(Provider<CateProvide>.value(cateProvide));

  runApp(ProviderNode(
    providers: provides,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}
