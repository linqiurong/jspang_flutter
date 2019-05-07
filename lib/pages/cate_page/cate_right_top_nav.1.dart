import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provide/provide.dart';
// import 'package:jspang_flutter_shop/provide/cate_provide.dart';
import 'package:jspang_flutter_shop/services/cate_services.dart';
import 'package:jspang_flutter_shop/model/category.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class CateRightTopNav extends StatelessWidget {
  List<BxMallSubDto> _bxMallSubDto = [];
  CateRightTopNav(this._bxMallSubDto);
  // 子菜单栏目ID
  String _rightTopCategoryID = '';
  CateService _cateServices = new CateService();

  CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (_bxMallSubDto != null && _bxMallSubDto.length > 0) {
      // 获取点击的子栏目
      this._rightTopCategoryID =
          _cateServices.cateProvide(context).getRightTopNavCategoryID();

      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this._bxMallSubDto.length,
        itemBuilder: (context, index) {
          return this._subItem(context, this._bxMallSubDto[index]);
        },
      );
    } else {
      return _commonWidgets.requestingData();
    }
  }

  // 单项
  Widget _subItem(BuildContext context, BxMallSubDto item) {
    return InkWell(
      onTap: () {
        // 设置子菜单
        _cateServices
            .cateProvide(context)
            .setRightTopNavCategoryID(item.mallSubId);
        // 设置为1
        _cateServices.cateProvide(context).setCatePage(1);

        // 获取当前点击分类下的商品列表
        _cateServices.getGoodsListData(context);
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
          alignment: Alignment.center,
          child: Text(
            "${item.mallSubName}",
            style: TextStyle(
                color: this._rightTopCategoryID == item.mallSubId
                    ? Colors.pink
                    : Colors.black),
          )),
    );
  }
}
