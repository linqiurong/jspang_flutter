import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSwiper extends StatelessWidget {
  // List swiperList = [];
  // HomeSwiper(this.swiperList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(180.0),
      padding: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(),
      child: Text("Swiper"),
    );
  }

  // Widget _swiper() {
  //   return Swiper(
  //     itemCount: this.swiperList.length,
  //     itemBuilder: (BuildContext context, index) {
  //       return Image.network(swiperList[index]['image'], fit: BoxFit.fill);
  //     },
  //   );
  // }
}
