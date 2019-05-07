import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeShopInfo extends StatelessWidget {
  final ShopInfo _shopInfo;
  HomeShopInfo(this._shopInfo);

  final CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this._shopInfo != null) {
      return InkWell(
        onTap: _launchUrl,
        child: Container(
          child: Image.network(this._shopInfo.leaderImage),
        ),
      );
    } else {
      return commonWidgets.requestingData();
    }
  }

  void _launchUrl() async {
    String url = 'tel:' + this._shopInfo.leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
