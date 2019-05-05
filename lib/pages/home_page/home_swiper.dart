import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
// 路由
import 'package:jspang_flutter_shop/routes/application.dart';
import 'package:fluro/fluro.dart';

class HomeSwiper extends StatelessWidget {
  List<Slides> _swiperList = [];
  HomeSwiper(this._swiperList);
  CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333.0),
      width: ScreenUtil().setWidth(750.0),
      child: Container(
        child: _swiper(),
      ),
    );
  }

  // 轮播图数据
  Widget _swiper() {
    // 有数据则才显示否则显示数据加载中...
    if (this._swiperList.length > 0) {
      return Swiper(
        itemCount: this._swiperList.length,
        control: new SwiperControl(),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              String jumpTo = "/detail/${this._swiperList[index].goodsId}";
              print("详情页面路由:" + jumpTo);
              Application.router.navigateTo(context, jumpTo,
                  transition: TransitionType.fadeIn);
            },
            child: Container(
              child: Image.network("${this._swiperList[index].image}",
                  fit: BoxFit.fill),
            ),
          );
        },
        pagination: new SwiperPagination(),
        autoplay: true,
      );
    } else {
      return commonWidgets.requestingData();
    }
  }
}
