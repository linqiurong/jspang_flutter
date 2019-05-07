import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/model/home_hot_model.dart';
import 'package:jspang_flutter_shop/services/http_services.dart';
import 'package:jspang_flutter_shop/provide/home_provide.dart';
import 'package:provide/provide.dart';
import 'dart:convert';

class HomeService {
  HttpServices httpServices = new HttpServices();
  // 首页的数据处理
  getHomeBaseData(BuildContext context) {
    Map locate = this.homeProvide(context).getLocate();
    // print("getHomeBaseData:" + locate.toString());
    httpServices.request('homeBase', params: locate).then((response) {
      var responseData = json.decode(response.toString());
      if (responseData != "") {
        HomeBaseDataModel homeBaseData =
            HomeBaseDataModel.fromJson(responseData);
        // return homeBaseData;
        this.homeProvide(context).setHomeBaseData(homeBaseData);
      } else {
        print("responseData:" + responseData.toString());
      }
    });
  }

  // 首页的热销数据处理
  getHomeHotData(BuildContext context) {
    int currentHotPage = this.homeProvide(context).getCurrentHotPage();
    // print("currentHotPage:" + currentHotPage.toString());
    Map page = {"page": currentHotPage};
    httpServices.request('homeHot', params: page).then((response) {
      //print("热销商品数据" + response.toString());
      var responseData = json.decode(response.toString());
      if (responseData != "") {
        HomeHotDataModel homeHotData = HomeHotDataModel.fromJson(responseData);
        // return homeBaseData;
        this.homeProvide(context).setHomeHotData(homeHotData);
      } else {
        print("responseData:" + responseData.toString());
      }
    });
  }

  // 获取 home provide
  HomeProvide homeProvide(BuildContext context) {
    HomeProvide homeProvide = Provide.value<HomeProvide>(context);
    return homeProvide;
  }
}
