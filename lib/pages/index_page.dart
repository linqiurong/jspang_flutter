import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/services/home_services.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_swiper.dart';

class IndexPage extends StatelessWidget {
  //
  HomeService services = new HomeService();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HomeSwiper(),
      ],
    );
  }
}
