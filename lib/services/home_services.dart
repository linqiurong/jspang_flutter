import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/services/http_services.dart';
import 'package:jspang_flutter_shop/provide/home_provide.dart';
import 'package:provide/provide.dart';

class HomeService {
  // 实例化
  HttpServices services = new HttpServices();

  // 获取首页的基本信息
  Future getHomeBaseData(Map locate) {
    if (locate != null) {
      // 获取数据
      return services.request('homeBase');
    }
    print("params:" + locate.toString());
    // 获取数据
    return services.request('homeBase', params: locate);
  }

  // 获取首页热销商品
  Future getHomeHotData() {
    // 获取数据
    return services.request('homeHot');
  }

  // 获取 home provide
  HomeProvide homeProvide(BuildContext context) {
    HomeProvide homeProvide = Provide.value<HomeProvide>(context);
    return homeProvide;
  }
}
