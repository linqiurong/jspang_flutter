import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/pages/cate_page/cate_left_menu.dart';
import 'package:jspang_flutter_shop/pages/cate_page/cate_right_top_nav.dart';
import 'package:jspang_flutter_shop/pages/cate_page/cate_right_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(750),
        child: Row(
          children: <Widget>[
            CateLeftMenu(),
            Column(
              children: <Widget>[CateRightTopNav(), CateRightContent()],
            )
          ],
        ));
  }
}
