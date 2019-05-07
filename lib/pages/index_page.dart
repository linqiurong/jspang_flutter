import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_swiper.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_cate.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_ad.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_shop_info.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_goods_recommend.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_floor.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_hot_title.dart';
import 'package:jspang_flutter_shop/pages/home_page/home_hot.dart';

import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/model/home_hot_model.dart';
import 'package:jspang_flutter_shop/model/category.dart';
import 'package:jspang_flutter_shop/services/home_services.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/home_provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

class IndexPage extends StatelessWidget {
  //
  final HomeService homeServices = new HomeService();
  // easyRefresh
  final GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  //
  final GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  //
  final GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  @override
  Widget build(BuildContext context) {
    // 获取首页数据并设置 provide数据
    homeServices.getHomeBaseData(context);
    homeServices.getHomeHotData(context);

    return Provide<HomeProvide>(builder: (context, child, val) {
      // 获取
      List<Slides> slides = homeServices.homeProvide(context).getSlidesList();
      List<Category> category =
          homeServices.homeProvide(context).getCategoryList();
      AdvertesPicture advertesPicture =
          homeServices.homeProvide(context).getAdvertesPicture();
      ShopInfo shopInfo = homeServices.homeProvide(context).getShopInfo();
      List<Recommend> goodsRecommendList =
          homeServices.homeProvide(context).getGoodsRecommendList();
      // 一楼层
      Floor1Pic floor1pic = homeServices.homeProvide(context).getFloor1Pic();
      List<Floor1> floor1 = homeServices.homeProvide(context).getFloor1();
      // 二楼层
      Floor2Pic floor2pic = homeServices.homeProvide(context).getFloor2Pic();
      List<Floor2> floor2 = homeServices.homeProvide(context).getFloor2();
      // 三楼层
      Floor3Pic floor3pic = homeServices.homeProvide(context).getFloor3Pic();
      List<Floor3> floor3 = homeServices.homeProvide(context).getFloor3();

      List<GoodsHotModel> hotGoodsList =
          homeServices.homeProvide(context).getHomeHotData();
      return EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: BallPulseHeader(
          key: _headerKey,
          color: Colors.white,
          backgroundColor: Colors.pink,
        ),
        refreshFooter: BallPulseFooter(
          key: _footerKey,
          color: Colors.white,
          backgroundColor: Colors.pink,
        ),
        onRefresh: () {
          // 重新获取数据 当前页面重置为1
          homeServices.getHomeBaseData(context);
          homeServices.homeProvide(context).setCurrentHotPage(1);
          //重新获取热销商品
          homeServices.getHomeHotData(context);
          print("onRefresh");
        },
        loadMore: () {
          homeServices.getHomeHotData(context);
        },
        child: ListView(
          children: <Widget>[
            HomeSwiper(slides),
            HomeCate(category),
            AdBanner(advertesPicture),
            HomeShopInfo(shopInfo),
            HomeGoodsRecommend(goodsRecommendList),
            HomeFloor(floor1pic, floor1),
            HomeFloor(floor2pic, floor2),
            HomeFloor(floor3pic, floor3),
            HomeHotTitle(),
            HomeHot(hotGoodsList)
          ],
        ),
      );
    });
  }
}
