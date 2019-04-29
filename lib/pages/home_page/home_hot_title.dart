import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        "火爆专区",
        style: TextStyle(fontSize: ScreenUtil().setSp(26.0)),
      ),
    );
  }
}
