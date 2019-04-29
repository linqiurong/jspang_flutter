import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class HomeSwiper extends StatelessWidget {
  List<Slides> swiperList = [];
  HomeSwiper(this.swiperList);
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
    if (this.swiperList.length > 0) {
      return Swiper(
        itemCount: this.swiperList.length,
        control: new SwiperControl(),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () => {},
            child: Container(
              child: Image.network("${this.swiperList[index].image}",
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
