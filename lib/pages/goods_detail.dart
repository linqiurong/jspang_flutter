import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/goods_detail_model.dart';
import 'package:jspang_flutter_shop/services/goods_detail_services.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:jspang_flutter_shop/pages/goods_detail_page/goods_info.dart';
import 'package:jspang_flutter_shop/pages/goods_detail_page/description.dart';
import 'package:jspang_flutter_shop/pages/goods_detail_page/detail_tab_bar.dart';
import 'package:jspang_flutter_shop/pages/goods_detail_page/advertise.dart';

import 'package:jspang_flutter_shop/pages/goods_detail_page/botton.dart';

import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/goods_detail_provide.dart';

class GoodsDetail extends StatelessWidget {
  String _goodsId;
  GoodsDetail(this._goodsId);
  Detail _goodsDetail;
  final GoodsDetailService _services = new GoodsDetailService();
  final CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    print("####GoodsDetail####:" + this._goodsId);
    // 设置商品ID
    this._services.goodsDetailProvide(context).setGoodsId(this._goodsId);
    // 请求商品数据
    this._services.getGoodsDetail(context);

    return Provide<GoodsDetailProvide>(builder: (context, child, val) {
      // 获取商品详情
      this._goodsDetail =
          this._services.goodsDetailProvide(context).getGoodsDetail();

      if (this._goodsDetail != null) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('商品详情'),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 0),
                child: ListView(
                  children: <Widget>[
                    GoodsInfo(this._goodsDetail.goodInfo),
                    Description(),
                    DetailTabBar(this._goodsDetail.goodInfo.goodsDetail),
                    Advertise(this._goodsDetail.advertesPicture),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Botton(this._goodsDetail.goodInfo),
              )
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('商品详情'),
          ),
          body: _commonWidgets.requestingData(),
        );
      }
    });
  }
}
