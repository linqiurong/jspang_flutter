import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/services/http_services.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cate_provide.dart';
import 'package:jspang_flutter_shop/model/cate_list_model.dart';
import 'package:jspang_flutter_shop/model/goods_list_model.dart';
import 'dart:convert';

class CateService {
  // 获取参数
  HttpServices _httpServices = new HttpServices();

  // 首页的数据处理
  getCateListData(BuildContext context) {
    _httpServices.request('category').then((response) {
      var responseData = json.decode(response.toString());
      // print("分类数据:" + responseData.toString());
      if (responseData != "") {
        CateListModel cateListModel = CateListModel.fromJson(responseData);
        this.cateProvide(context).setCateListData(cateListModel.data);
      } else {
        print("responseData:" + responseData.toString());
      }
    });
  }

  // 获取分类栏目对应的商品列表
  getGoodsListData(BuildContext context) {
    // 大类ID
    String categoryID = this.cateProvide(context).getLeftMenuCategoryID();
    // 小类ID
    String subCategoryID = this.cateProvide(context).getRightTopNavCategoryID();
    // 当前 page
    int currentPage = this.cateProvide(context).getCatePage();
    Map params = {
      'categoryId': categoryID,
      'categorySubId': subCategoryID,
      'page': currentPage
    };

    print("分类请求参数:" + params.toString());

    _httpServices.request('goodsList', params: params).then((response) {
      var responseData = json.decode(response.toString());
      // print("分类对应分类ID的数据:" + responseData.toString());
      if (responseData != "") {
        GoodsListModel goodsListModel = GoodsListModel.fromJson(responseData);
        this.cateProvide(context).setGoodsListData(goodsListModel.data);
      } else {
        print("responseData:" + responseData.toString());
      }
    });
  }

  CateProvide cateProvide(BuildContext context) {
    CateProvide cateProvide = Provide.value<CateProvide>(context);
    return cateProvide;
  }
}
