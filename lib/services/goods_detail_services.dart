import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/goods_detail_model.dart';
import 'package:jspang_flutter_shop/services/http_services.dart';
import 'package:jspang_flutter_shop/provide/goods_detail_provide.dart';
import 'package:provide/provide.dart';
import 'dart:convert';

class GoodsDetailService {
  HttpServices _httpServices = new HttpServices();
  // 首页的数据处理
  getGoodsDetail(BuildContext context) {
    String goodsId = this.goodsDetailProvide(context).getGoodsId();
    print("goodsId:" + goodsId);
    if (goodsId != '') {
      Map params = {"goodId": goodsId};
      _httpServices.request('goodsDetail', params: params).then((response) {
        var responseData = json.decode(response.toString());
        print("商品详情:" + responseData.toString());
        if (responseData != "") {
          GoodsDetailModel goodsDetail =
              GoodsDetailModel.fromJson(responseData);
          this.goodsDetailProvide(context).setGoodsDetail(goodsDetail.data);
        } else {
          print("responseData:" + responseData.toString());
        }
      });
    } else {
      print("goodsId为空");
    }
  }

  // 获取 home provide
  GoodsDetailProvide goodsDetailProvide(BuildContext context) {
    GoodsDetailProvide goodsDetailProvide =
        Provide.value<GoodsDetailProvide>(context);
    return goodsDetailProvide;
  }
}
