import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/model/home_hot_model.dart';
import 'package:jspang_flutter_shop/model/category.dart';

class HomeProvide with ChangeNotifier {
  //
  HomeBaseDataModel _homeBaseData;
  // 轮播图
  List<Slides> _slides = [];
  // 分类
  List<Category> _categoryList = [];
  // 广告图片
  AdvertesPicture _advertesPicture;
  // 店铺信息
  ShopInfo _shopInfo;
  // 推荐商品
  List<Recommend> _goodsRecommendList = [];
  // 一层图片
  Floor1Pic _floor1pic;
  List<Floor1> _floor1 = [];
  // 二层图片
  Floor2Pic _floor2pic;
  List<Floor2> _floor2 = [];
  // 三层图片
  Floor3Pic _floor3pic;
  List<Floor3> _floor3 = [];
  // 热销商品
  List<GoodsHotModel> _goodsHotData = [];
  // 默认当前热销页面为第1页
  int _currentHotPage = 1;

  IntegralMallPic _integralMallPic;

  //  设置默认当前的定位
  Map locate = {};
  //  底部按钮位置
  int bottomIndex = 0;

  HomeBaseDataModel getHomeBaseData() {
    return this._homeBaseData;
  }

  List<GoodsHotModel> getHomeHotData() {
    return this._goodsHotData;
  }

  void setHomeHotData(HomeHotDataModel homeHotData) {
    if (this._currentHotPage == 1) this._goodsHotData = [];
    if (homeHotData != null) {
      this._goodsHotData.addAll(homeHotData.data);
      this._currentHotPage++;
      notifyListeners();
    }
  }

  // 设置值
  void setHomeBaseData(HomeBaseDataModel homeBaseData) {
    if (homeBaseData != null) {
      // 赋值
      this.setSlidesList(homeBaseData.data.slides);
      this.setCategoryList(homeBaseData.data.category);
      this.setAdvertesPicture(homeBaseData.data.advertesPicture);
      this.setIntegralMallPic(homeBaseData.data.integralMallPic);
      this.setShopInfo(homeBaseData.data.shopInfo);
      this.setGoodsRecommendList(homeBaseData.data.recommend);

      this.setFloor1Pic(homeBaseData.data.floor1Pic);
      this.setFloor2Pic(homeBaseData.data.floor2Pic);
      this.setFloor3Pic(homeBaseData.data.floor3Pic);
      this.setFloor1(homeBaseData.data.floor1);
      this.setFloor2(homeBaseData.data.floor2);
      this.setFloor3(homeBaseData.data.floor3);
      // 通知
      notifyListeners();
    } else {
      print("暂未有数据");
    }
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

  //  获取轮播图
  List<Slides> getSlidesList() {
    return this._slides;
  }

  // 设置轮播图
  void setSlidesList(List<Slides> slides) {
    this._slides = slides;
  }

  // 获取分类
  List<Category> getCategoryList() {
    return this._categoryList;
  }

  // 设置分类
  void setCategoryList(List<Category> categoryList) {
    this._categoryList = categoryList;
  }

  // 获取
  IntegralMallPic getIntegralMallPic() {
    return this._integralMallPic;
  }

  // 设置
  void setIntegralMallPic(IntegralMallPic integralMallPic) {
    this._integralMallPic = integralMallPic;
  }

  // 获取广告
  AdvertesPicture getAdvertesPicture() {
    return this._advertesPicture;
  }

  // 设置广告
  void setAdvertesPicture(AdvertesPicture advertesPicture) {
    this._advertesPicture = advertesPicture;
    notifyListeners();
  }

  // 获取店铺信息
  ShopInfo getShopInfo() {
    return this._shopInfo;
  }

  // 设置店铺信息
  void setShopInfo(ShopInfo shopInfo) {
    this._shopInfo = shopInfo;
  }

  // 获取推荐商品信息
  List<Recommend> getGoodsRecommendList() {
    return this._goodsRecommendList;
  }

  // 设置推荐商品信息
  void setGoodsRecommendList(List<Recommend> goodsRecommendList) {
    this._goodsRecommendList = goodsRecommendList;
  }

  // 一层Img
  Floor1Pic getFloor1Pic() {
    return this._floor1pic;
  }

  // -层Img
  void setFloor1Pic(Floor1Pic floor1Pic) {
    this._floor1pic = floor1Pic;
  }

  // 一层数据
  List<Floor1> getFloor1() {
    return this._floor1;
  }

  // -层数据
  void setFloor1(List<Floor1> floor1) {
    this._floor1 = floor1;
  }

  // 二层Img
  Floor2Pic getFloor2Pic() {
    return this._floor2pic;
  }

  // 二层Img
  void setFloor2Pic(Floor2Pic floor2Pic) {
    this._floor2pic = floor2Pic;
  }

  // 二层数据
  List<Floor2> getFloor2() {
    return this._floor2;
  }

  // 二层数据
  void setFloor2(List<Floor2> floor2) {
    this._floor2 = floor2;
  }

  // 三层Img
  Floor3Pic getFloor3Pic() {
    return this._floor3pic;
  }

  // 三层Img
  void setFloor3Pic(Floor3Pic floor3Pic) {
    this._floor3pic = floor3Pic;
  }

  // 三层数据
  List<Floor3> getFloor3() {
    return this._floor3;
  }

  // 三层数据
  void setFloor3(List<Floor3> floor3) {
    this._floor3 = floor3;
  }

  // 设置当前热销的页面数
  void setCurrentHotPage(int currentHotPage) {
    this._currentHotPage = currentHotPage;
    notifyListeners();
  }

  // 获取当前热销页面的数
  int getCurrentHotPage() {
    return this._currentHotPage;
  }
}
