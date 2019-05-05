import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0, 10.0),
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
      width: ScreenUtil().setWidth(750.0),
      child: Text(
        "说明: >急速送达 >正品保证",
        style: TextStyle(fontSize: ScreenUtil().setSp(28.0), color: Colors.red),
      ),
    );
  }
}
