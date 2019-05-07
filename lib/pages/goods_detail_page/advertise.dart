import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/goods_detail_model.dart';

class Advertise extends StatelessWidget {
  final AdvertesPicture _advertesPicture;
  Advertise(this._advertesPicture);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750.0),
      child: Image.network(this._advertesPicture.pICTUREADDRESS),
    );
  }
}
