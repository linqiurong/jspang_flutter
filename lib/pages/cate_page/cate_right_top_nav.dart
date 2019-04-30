import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cate_provide.dart';
import 'package:jspang_flutter_shop/services/cate_services.dart';
import 'package:jspang_flutter_shop/model/cate_list_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class CateRightTopNav extends StatelessWidget {
  List<BxMallSubDto> _bxMallSubDto = [];
  // 子菜单栏目ID
  String _rightTopCategoryID = '';
  CateService cateServices = new CateService();

  CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(569.0),
      height: ScreenUtil().setHeight(80.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: ScreenUtil().setWidth(1.0), color: Colors.black12))),
      child: Provide<CateProvide>(
        builder: (context, child, val) {
          _bxMallSubDto =
              cateServices.cateProvide(context).getSubCateListData();
          if (_bxMallSubDto != null && _bxMallSubDto.length > 0) {
            // 获取点击的子栏目
            this._rightTopCategoryID =
                cateServices.cateProvide(context).getRightTopNavCategoryID();
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this._bxMallSubDto.length,
              itemBuilder: (context, index) {
                return this._subItem(context, this._bxMallSubDto[index]);
              },
            );
          } else {
            return commonWidgets.requestingData();
          }
        },
      ),
    );
  }

  // 子菜单列表 未使用  已使用ListView.builder
  // List<Widget> _subList(BuildContext context) {
  //   List<Widget> tmpWidgetList = [];
  //   this._bxMallSubDto.forEach((item) {
  //     tmpWidgetList.add(this._subItem(context, item));
  //   });
  //   return tmpWidgetList;
  // }

  // 单项
  Widget _subItem(BuildContext context, BxMallSubDto item) {
    return InkWell(
      onTap: () {
        // 设置子菜单
        cateServices
            .cateProvide(context)
            .setRightTopNavCategoryID(item.mallSubId);
        // 重新获取数据
        // 设置为1
        cateServices.cateProvide(context).setCatePage(1);
        // 获取当前点击分类下的商品列表
        cateServices.getGoodsListData(context);
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
