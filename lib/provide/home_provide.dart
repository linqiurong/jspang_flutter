import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/services/home_services.dart';

class HomeProvide with ChangeNotifier {
  //  数据列表
  List homeBaseData = [];
  //  设置默认当前的定位
  Map locate = {};
  //  底部按钮位置
  int bottomIndex = 0;
  //

  // 实例化
  HomeService homeService = new HomeService();

  // 获取值
  List getHomeBaseData() {
    print(this.locate);
    homeService.getHomeBaseData(this.getLocate()).then((response) {
      //
    });
    return homeBaseData;
  }

  // 设置值
  void setHomeBaseData(homeBaseData) {
    this.homeBaseData = homeBaseData;
    // 通知
    notifyListeners();
  }

  // 设置值
  void setLocate(location) {
    this.locate = location;
    notifyListeners();
  }

  // 取值
  Map getLocate() {
    return this.locate;
  }

  // 获取当前按钮点击的index
  int getBottonIndex() {
    return this.bottomIndex;
  }

  // 设置当前按钮点击的index
  void setBottonIndex(int index) {
    this.bottomIndex = index;
    notifyListeners();
  }
}
