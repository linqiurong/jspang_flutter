import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeShopInfo extends StatelessWidget {
  ShopInfo shopInfo;
  HomeShopInfo(this.shopInfo);

  CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this.shopInfo != null) {
      return InkWell(
        onTap: _launchUrl,
        child: Container(
          child: Image.network(this.shopInfo.leaderImage),
        ),
      );
    } else {
      return commonWidgets.requestingData();
    }
  }

  void _launchUrl() async {
    String url = 'tel:' + this.shopInfo.leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
